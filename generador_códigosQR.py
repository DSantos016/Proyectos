# Generador código QR
    
import qrcode

def generate_qr_code(text, file_name):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=3,
    )
    qr.add_data(text)
    qr.make(fit=True)
    img = qr.make_image(fill_color="#4B8BBE", back_color= "#FFFFFF")
    img.save(file_name)
    
if __name__ == "__main__":
    user_text = input("Introduce el texto o URL para generar el código QR: ")
    file_name = input("Introduce el nombre del archivo (Con extensión .png): ")
    
    generate_qr_code(user_text,file_name)
    print(f"QR code generado como {file_name}")
    