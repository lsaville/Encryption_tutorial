class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
    letters = string.split('')
    results = letters.collect do |letter|
    encrypted_letter = encrypt_letter(letter, rotation)
  end
    results.join
 end

  def decrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(-rotation)
    cipher_for_rotation[letter]
  end

  def decrypt(string, rotation)
    letters = string.split('')
    results = letters.collect do |letter|
    decrypted_letter = decrypt_letter(letter, rotation)
  end
    results.join
  end

  def encrypt_file(filename, rotation)
    #create the file handle to the input file
    input = File.open(filename, 'r')
    #read the text of the input file
    content = input.read
    #encrypt the text
    encrypted_content = encrypt(content, rotation)
    #create a name for the output file
    encrypted_file = filename + '.encrypted'
    #create an output file handle
    out = File.open(encrypted_file, 'w')
    #write out the text
    out.write(encrypted_content)
    #close the file
    out.close
  end

  def decrypt_file(filename, rotation)
    #create the file handle to the encrypted file
    input = File.open(filename, 'r')
    #read the encrypted text
    contents = input.read
    #decrypt the text by passing in the text and rotation
    decrypted_content = decrypt(contents, rotation)
    #create a name for the decrypted file
    decrypted_file = filename.gsub(/encrypted/, "decrypted")
    #create an output file handle
    out = File.open(decrypted_file, 'w')
    #write out the text
    out.write(decrypted_content)
    #close the file
    out.close
  end
end
