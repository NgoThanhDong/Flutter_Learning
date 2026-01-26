# Flutter Roadmap – From Hello World to Production UX & State Management

Lộ trình học Flutter theo hướng **hiểu bản chất – UX chuẩn – kiến trúc rõ ràng – dùng được cho production**, không học rời rạc theo tutorial.

---

## 1. Hello World & Environment

- Cài Flutter SDK, VS Code
- Hiểu entry point:
  - `main()`
  - `runApp()`
- Chạy app Flutter đầu tiên
- Làm quen cấu trúc project Flutter

🎯 Kết quả: Flutter chạy được, biết app bắt đầu từ đâu

---

## 2. Core Widgets & Layout

- Widget cơ bản: `Text`, `Container`, `Image`, `Button`
- Layout: `Row`, `Column`, `Expanded`, `Flexible`
- Spacing: `Padding`, `Margin`
- Scroll: `ListView`, `SingleChildScrollView`
- Material: `Scaffold`, `AppBar`

🎯 Kết quả: Xây dựng được UI, hiểu widget tree

---

## 3. State cơ bản với setState

- StatelessWidget vs StatefulWidget
- `setState()` và cơ chế rebuild
- Truyền dữ liệu cha → con
- Quản lý state đơn giản trong widget

🎯 Kết quả: UI phản ứng theo state

---

## 4. Flutter Foundation (Bản chất Flutter)

- Widget Tree – Element Tree – RenderObject Tree
- Rebuild vs Repaint
- Widget lifecycle:
  - `initState`
  - `didUpdateWidget`
  - `dispose`
- State ownership
- `ValueNotifier` & `ValueListenableBuilder`
- `Key` và lỗi reorder
- Debug bằng DevTools

🎯 Kết quả: Hiểu Flutter hoạt động như thế nào

---

## 5. Navigation & Routing

- Navigator 1.0:
  - `push`, `pop`, `popUntil`
- Truyền dữ liệu giữa các page
- Named routes & `onGenerateRoute`
- Auth flow (login / logout)
- Nested navigator
- Bottom navigation
- Deep link
- Reset navigation stack đúng cách

🎯 Kết quả: Làm chủ navigation thật sự

---

## 6. UX State (User Experience State)

- Các trạng thái UX:
  - Loading
  - Success
  - Empty
  - Error
- Render UI theo UX state
- Dùng `ValueNotifier` quản lý UX state
- Kết hợp UX state với navigation

🎯 Kết quả: UI đúng hành vi người dùng

---

## 7. UX Production (Web & App)

- Chặn tương tác khi loading:
  - `AbsorbPointer`
- Chặn back:
  - `WillPopScope`
  - `PopScope`
- Overlay loading
- Giữ UI ổn định khi xử lý
- Kiểm soát hành vi người dùng (không chỉ UI)

🎯 Kết quả: UX đạt mức production-ready

---

## 8. State Management với Bloc

- Vì sao không dùng `setState` cho app lớn
- Kiến trúc Bloc:
  - Event
  - State
  - Bloc
- Luồng dữ liệu: UI → Event → Bloc → State → UI
- Tách UI và business logic
- UI chỉ render theo state

🎯 Kết quả: Code rõ ràng, dễ mở rộng

---

## 9. Refactor UX State sang Bloc

- Chuyển toàn bộ UX state vào Bloc
- Bloc điều khiển:
- Loading
- Error
- Retry
- Navigation condition
- Widget chỉ còn render

🎯 Kết quả: Kiến trúc sạch, dễ test

---

## 10. Bloc nâng cao

- Nhiều event / state
- `BlocBuilder` vs `BlocListener`
- Side effects:
- Dialog
- Snackbar
- Navigation
- App-level state
- Chuẩn bị cho test Bloc

🎯 Kết quả: Sẵn sàng cho app thực tế

---

## Mục tiêu cuối cùng

- Hiểu sâu Flutter, không học vẹt
- UX đúng hành vi người dùng
- Code có kiến trúc, dễ bảo trì
- Áp dụng được cho Flutter Web & App production
