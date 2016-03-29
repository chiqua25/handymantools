/*     
    Author: Rahul Rajat Singh
    URL: http://www.codeproject.com/Articles/608860/Understanding-and-Implementing-Password-Hashing
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HashAndSalt
{
    public class PasswordManager
    {
        HashComputer m_hashComputer = new HashComputer();

        public string GeneratePasswordHash(string plainTextPassword, out string salt)
        {
            salt = SaltGenerator.GetSaltString();

            string finalString = plainTextPassword + salt;

            return m_hashComputer.GetPasswordHashAndSalt(finalString);
        }

        public bool IsPasswordMatch(string password, string salt, string hash)
        {
            string finalString = password + salt;
            return hash == m_hashComputer.GetPasswordHashAndSalt(finalString);
        }
    }
}
