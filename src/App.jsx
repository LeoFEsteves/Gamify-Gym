import { useState } from 'react'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div className="w-full h-dvh bg-black-light">
          <div className="w-full h-1/8 flex justify-evenly items-center bg-gradient-to-t from-black-dark to-black-light to-30% ">
            <div className=" text-white text-2xl hover:text-purple-light font-bold w-auto h-1/2 ">Gamify Gym</div>
            <div className="bg-purple-dark w-1/12 h-1/2"></div>
          </div>
        </div>
    </>
  )
}

export default App
