module Store where

import Effect (Effect)

foreign import data Store :: Type -> Type

type StoreBundle state action = 
  { store :: Store state
  , dispatch :: action -> Effect state 
  , dispatchJS :: action -> state     
  }

foreign import createStoreImpl 
  :: forall state action
   . state 
  -> (state -> action -> state) 
  -> StoreBundle state action

createStore :: forall state action. state -> (state -> action -> state) -> StoreBundle state action
createStore = createStoreImpl

foreign import useStore :: forall state action view. 
                           StoreBundle state action 
                        -> (state -> view) 
                        -> Store view

foreign import readStoreImpl :: forall a. Store a -> Effect a

readStore :: forall a. Store a -> Effect a
readStore = readStoreImpl
