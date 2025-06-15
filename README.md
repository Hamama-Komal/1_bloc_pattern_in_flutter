# Flutter BLoC with Cubit 🧩

## With Code Example – Internet Connectivity (Using Cubit)

> **Goal:** Learn the basics of BLoC and Cubit patterns in Flutter with simple theory and working app code.

---

## 1. The Data Flow

### BLoC
- **UI → Event → BLoC**: The user triggers an **Event** (e.g., button press).
- **BLoC → State → UI**: The BLoC processes the event and emits a **State** that the UI reacts to.

### Cubit
- **UI → Function → Cubit**: Instead of using events, Cubit calls a function directly.
- **Cubit → State → UI**: Cubit emits a **State** and the UI rebuilds based on it.

---

## 2. Key Vocabulary
| Term      | What it is                  | One-liner Description |
|-----------|-----------------------------|------------------------|
| **BLoC**  | Business Logic Component     | Uses Events and States for complex logic. |
| **Cubit** | Simpler version of BLoC     | No events—just function calls and state. |
| **Event** | Dart class (BLoC only)      | Represents something that happened. |
| **State** | Dart class or Enum          | Represents the current UI status. |
| **Emit**  | Function in BLoC/Cubit      | Emits a new state to update the UI. |

> ✅ BLoC = needs Events to emit States  
> ✅ Cubit = uses functions to emit States

---

## 3. Providing the BLoC or Cubit
- Wrap your `MaterialApp` or `MyApp` with `BlocProvider`.
- This allows any widget in the widget tree to access your Cubit or BLoC instance using `context.read<T>()` or `context.watch<T>()`.

---

## 4. Reacting in the UI
| Widget           | Purpose                        | Rebuild UI? | Listen for Side Effects? |
|------------------|--------------------------------|-------------|---------------------------|
| `BlocBuilder`    | Rebuilds when state changes    | ✅          | ❌                        |
| `BlocListener`   | Triggers SnackBars, dialogs    | ❌          | ✅                        |
| `BlocConsumer`   | Combines both above            | ✅          | ✅                        |

---

## 5. Equality Checks
| Operator | Use When...          | Example                              |
|----------|----------------------|--------------------------------------|
| `is`     | Working with classes | `if (state is LoadingState)`         |
| `==`     | Working with Enums   | `if (state == InternetState.Connected)` |

> 📌 For Enums in Cubit, always use `==` to check states.

---

## 6. Best Practice Cheat Sheet ✅
1. Use **BLoC** for complex flows with many events.
2. Use **Cubit** for simple tasks like connectivity or toggling.
3. Keep **State** simple (prefer Enums or small classes).
4. Never change the same state—**emit new states** every time.
5. Show SnackBars or dialogs only inside `listener`, not `builder`.

---

## 7. Mental Model 🧠
> *Event* = **What happened** (in BLoC)  
> *Function* = **What to do** (in Cubit)  
> *State* = **Current condition**

If your feature can be described in 2–3 states, **use Cubit**. It’s simpler and faster to implement.

---

## 8. Learn More 🚀
Want to continue learning?

- 📘 [Official BLoC Docs](https://bloclibrary.dev/#/)

Happy Fluttering! 💙
