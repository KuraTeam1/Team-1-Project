import logo from './logo.svg';
import './App.css';
import { generate } from './utils/words';
import useKeyPress from './hooks/useKeyPress';
import React, { useState } from 'react';
import { currentTime } from './utils/time';

const initialWords = generate();
console.log(initialWords);


function App() {
  
  useKeyPress(key => {
    //1b
    if (!startTime) {
      setStartTime(currentTime());
    }

    //console.log(key) //checking that keypress works
    //1a
    let updatedOutgoingChars = outgoingChars;
    let updatedIncomingChars = incomingChars;
    
    //2a
    if (key === currentChar) {
      //3a
      if (leftPadding.length > 0) {
        setLeftPadding(leftPadding.substring(1));
      }
      //4a
      updatedOutgoingChars += currentChar;
      setOutgoingChars(updatedOutgoingChars);
      
      //5a      
      setCurrentChar(incomingChars.charAt(0));
      
      //6a
      updatedIncomingChars = incomingChars.substring(1);
      if (updatedIncomingChars.split(' ').length < 10) {
        updatedIncomingChars +=' ' + generate();
      }
      setIncomingChars(updatedIncomingChars);
    }

    if (key === currentChar) {
      //2b
      if (incomingChars.charAt(0) === ' ') {
        //4b
        setWordCount(wordCount + 1);
        //5b
        const durationInMinutes = (currentTime() - startTime) / 60000.0;
        //6b
        setWpm(((wordCount + 1) / durationInMinutes).toFixed(2));
      }
    }

    //2c
    const updatedTypedChars = typedChars + key;
    setTypedChars(updatedTypedChars);
    //3c
    setAccuracy(
      ((updatedOutgoingChars.length * 100) / updatedTypedChars.length).toFixed(
        2,
      ),
    );

  });

  //States Section
  const [leftPadding, setLeftPadding] = useState(
    new Array(20).fill(' ').join(''),
  );
  const [outgoingChars, setOutgoingChars] = useState('');
  const [currentChar, setCurrentChar] = useState(initialWords.charAt(0));
  const [incomingChars, setIncomingChars] = useState(initialWords.substr(1));


  const [startTime, setStartTime] = useState();
  const [wordCount, setWordCount] = useState(0);
  const [wpm, setWpm] = useState(0);

  //1c
  const [accuracy, setAccuracy] = useState(0);
  const [typedChars, setTypedChars] = useState('');

  return (
    <div className="App">

      

      <header className="App-header">

        <h3>
            T1 Typing Arena
        </h3>
        

        <p className="Character">
          <span className="Character-out">
            {(leftPadding + outgoingChars).slice(-20)}
          </span>
          <span className="Character-current">{currentChar}</span>
          <span>{incomingChars.substr(0, 20)}</span>
        </p>

        <h3>
          WPM: {wpm} | Accuracy: {accuracy}%
        </h3>
        

        
      </header>
    </div>
  );
}

export default App;
