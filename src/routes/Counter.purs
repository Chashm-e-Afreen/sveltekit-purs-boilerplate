module Counter where

import Prelude

import Effect (Effect)
import Store (Store, StoreBundle, createStore, useStore)

type State = 
  { count :: Int 
  , isDark :: Boolean
  }

initialState :: State
initialState = 
  { count: 0 
  , isDark: false
  }

data Action 
  = Increment 
  | Decrement
  | ToggleTheme

reducer :: State -> Action -> State
reducer state action = case action of
  Increment -> state { count = state.count + 1 }
  Decrement -> state { count = state.count - 1 }
  ToggleTheme -> state { isDark = not state.isDark }

storeBundle :: StoreBundle State Action
storeBundle = createStore initialState reducer

store :: Store State
store = storeBundle.store

count :: Store Int
count = useStore storeBundle (\s -> s.count)

isDark :: Store Boolean
isDark = useStore storeBundle (\s -> s.isDark)

increment :: Effect State
increment = storeBundle.dispatch Increment

decrement :: Effect State
decrement = storeBundle.dispatch Decrement

toggleTheme :: Effect State
toggleTheme = storeBundle.dispatch ToggleTheme

getTheme :: Store Boolean
getTheme = useStore storeBundle (\s -> s.isDark)

