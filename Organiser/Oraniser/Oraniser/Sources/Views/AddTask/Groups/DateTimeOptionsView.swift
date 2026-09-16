//
//  DateTimeOptionsView.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 07.09.2026.
//

import SwiftUI

struct DateTimeOptionsView: View {

    @State private var isDateEnabled = false
    @State private var isTimeEnabled = false

    @State private var showDatePicker = false
    @State private var showTimePicker = false

    @State private var timePickerDate = Date()
    @State private var timePickerInitialDate = Date()

    @Binding var draft: TaskDraft

    private var dueDateBinding: Binding<Date> {
        Binding {
            draft.dueDate ?? Date()
        } set: { newDate in
            draft.dueDate = newDate
        }
    }

    private var minimumTime: Date {
        guard let dueDate = draft.dueDate else {
            return Date()
        }

        if Calendar.current.isDateInToday(dueDate) {
            return Date()
        } else {
            return Calendar.current.startOfDay(for: dueDate)
        }
    }

    private var formattedDate: String? {
        guard let dueDate = draft.dueDate else {
            return nil
        }

        let calendar = Calendar.current

        if calendar.isDateInToday(dueDate) {
            return "Сьогодні"
        }

        if calendar.isDateInTomorrow(dueDate) {
            return "Завтра"
        }

        if let tomorrow = calendar.date(byAdding: .day, value: 2, to: Date()),
           calendar.isDate(dueDate, inSameDayAs: tomorrow) {
            return "Післязавтра"
        }

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "uk_UA")
        formatter.dateFormat = "d MMMM yyyy"

        return formatter.string(from: dueDate)
    }

    private var formattedTime: String? {
        guard let dueDate = draft.dueDate else {
            return nil
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        return formatter.string(from: dueDate)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Дата та час")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 28)

            TaskOptionGroup {

                // ДАТА

                TaskOptionCell(
                    title: "Дата",
                    icon: "calendar",
                    isDisabled: false,
                    isOn: $isDateEnabled
                ) {
                    if showDatePicker {
                        DatePicker(
                            "",
                            selection: dueDateBinding,
                            in: Calendar.current.startOfDay(for: Date())...,
                            displayedComponents: [.date]
                        )
                        .environment(\.locale, Locale(identifier: "uk_UA"))
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .tint(appAccentColor)
                        .onChange(of: draft.dueDate) {
                            showDatePicker = false
                        }
                    } else if let formattedDate {
                        Button {
                            showDatePicker = true
                        } label: {
                            HStack {
                                Text(formattedDate)
                                    .foregroundStyle(appAccentColor)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                }

                Divider()

                // ЧАС

                TaskOptionCell(
                    title: "Час",
                    icon: "clock",
                    isDisabled: false,
                    isOn: $isTimeEnabled
                ) {
                    if showTimePicker {
                        DatePicker(
                            "",
                            selection: $timePickerDate,
                            in: minimumTime...,
                            displayedComponents: [.hourAndMinute]
                        )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onChange(of: timePickerDate) { _, newValue in

                            // Не закриваємо Picker,
                            // коли він тільки відкрився
                            if newValue == timePickerInitialDate {
                                return
                            }

                            guard let dueDate = draft.dueDate else {
                                return
                            }

                            let calendar = Calendar.current

                            draft.dueDate = calendar.date(
                                bySettingHour: calendar.component(.hour, from: newValue),
                                minute: calendar.component(.minute, from: newValue),
                                second: 0,
                                of: dueDate
                            )

                            showTimePicker = false
                        }
                    } else if let formattedTime {
                        Button {
                            if let dueDate = draft.dueDate {
                                timePickerDate = dueDate
                                timePickerInitialDate = dueDate
                            }

                            showTimePicker = true
                        } label: {
                            HStack {
                                Text(formattedTime)
                                    .foregroundStyle(appAccentColor)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                }

                Divider()

                // НАГАДУВАННЯ

                Menu {
                    Picker("Нагадування", selection: $draft.reminder) {
                        Text("Немає").tag(ReminderOption?.none)

                        ForEach(ReminderOption.allCases, id: \.self) { option in
                            Text(option.title)
                                .tag(ReminderOption?.some(option))
                        }
                    }

                } label: {
                    HStack {
                        Image(systemName: "bell.fill")
                            .foregroundStyle(
                                !isDateEnabled || !isTimeEnabled
                                ? .secondary
                                : .primary
                            )
                            .frame(width: 22)

                        Text("Нагадування")
                            .foregroundStyle(
                                !isDateEnabled || !isTimeEnabled
                                ? .secondary
                                : .primary
                            )

                        Spacer()

                        Text(draft.reminder?.title ?? "Немає")
                            .foregroundStyle(.secondary)

                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .contentShape(Rectangle())
                }
                .disabled(!isDateEnabled || !isTimeEnabled)

                Divider()

                // ПОВТОР

                Menu {
                    Picker("Повтор", selection: $draft.repeatRule) {
                        Text("Ніколи").tag(RepeatRule?.none)

                        ForEach(RepeatRule.allCases, id: \.self) { rule in
                            Text(rule.title)
                                .tag(RepeatRule?.some(rule))
                        }
                    }

                } label: {
                    HStack {
                        Image(systemName: "repeat")
                            .foregroundStyle(
                                !isDateEnabled
                                ? .secondary
                                : .primary
                            )
                            .frame(width: 22)

                        Text("Повтор")
                            .foregroundStyle(
                                !isDateEnabled
                                ? .secondary
                                : .primary
                            )

                        Spacer()

                        Text(draft.repeatRule?.title ?? "Ніколи")
                            .foregroundStyle(.secondary)

                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .contentShape(Rectangle())
                }
                .disabled(!isDateEnabled)

                Divider()

                // ТЕРМІНОВО

                TaskOptionCell(
                    title: "Терміново",
                    icon: "exclamationmark.circle.fill",
                    isDisabled: false,
                    isOn: $draft.isUrgency
                ) {
                    EmptyView()
                }
            }

            .onChange(of: isDateEnabled) {
                if isDateEnabled {
                    if draft.dueDate == nil {
                        draft.dueDate = Calendar.current.startOfDay(for: Date())
                    }

                    showDatePicker = true

                } else {
                    isTimeEnabled = false
                    showDatePicker = false
                    showTimePicker = false

                    draft.dueDate = nil
                    draft.reminder = nil
                    draft.repeatRule = nil
                }
            }

            .onChange(of: isTimeEnabled) {
                if isTimeEnabled {

                    if draft.dueDate == nil {
                        isDateEnabled = true
                        draft.dueDate = Calendar.current.startOfDay(for: Date())
                    }

                    // Готуємо окремий Date для Picker.
                    // Дата залишається тією самою,
                    // але Picker одразу відкривається.
                    if let dueDate = draft.dueDate {
                        timePickerDate = dueDate
                        timePickerInitialDate = dueDate
                    }

                    showTimePicker = true

                } else {
                    showTimePicker = false
                    draft.reminder = nil

                    if let dueDate = draft.dueDate {
                        draft.dueDate = Calendar.current.startOfDay(for: dueDate)
                    }
                }
            }
        }
    }
}
