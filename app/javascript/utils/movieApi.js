import axios from 'axios';

var omdb = axios.create({
    baseURL: 'http://omdbapi.com',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }
  });

export default omdb;
