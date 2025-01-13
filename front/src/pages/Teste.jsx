import React from 'react';

const Teste = () => {
  return (
    <div>
      <h1>Bem-vindo à Página Teste!</h1>
      <p>Este é o conteúdo da página de Testes da nossa aplicação. O lugar onde os bugs nascem e morrem....</p>
      <form method="get">
        <label>Peso</label>
        <input type="Number" className="bg-purple-light"></input>
        <label>Data</label>
        <input type="date" className="bg-purple-light"></input>
      </form>
    </div>

  );
};

export default Teste;