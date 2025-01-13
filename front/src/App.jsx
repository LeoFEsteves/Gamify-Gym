import { useState } from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Home from './pages/Home';
import Teste from './pages/Teste';

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
    <Router>
      <Link to="/">Home</Link>
      <Link to="/teste">Teste</Link>

      <Routes>
        <Route path="/" element={<Home />}/>
        <Route path="/teste" element={<Teste />}/>
      </Routes>
    </Router>
    </>
  )
}

export default App
