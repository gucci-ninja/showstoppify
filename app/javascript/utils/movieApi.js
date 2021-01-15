import axios from 'axios';

var omdb = axios.create({
    baseURL: 'https://omdbapi.com',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }
  });

export default omdb;
