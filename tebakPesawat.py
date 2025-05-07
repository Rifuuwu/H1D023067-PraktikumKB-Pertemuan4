import tkinter as tk
from tkinter import ttk
from pyswip import Prolog
from tkinter import messagebox

# Inisialisasi prolog
prolog = Prolog()
prolog.consult("tebakPesawat.pl")
pesawat = list()
ciri = dict()
index_pesawat = 0
index_ciri = 0
current_pesawat = ""
current_ciri = ""

def mulai_tebakan():
    global pesawat, ciri, index_pesawat, index_ciri
    # Bersihkan database prolog
    prolog.retractall("ciri_pos(_)")
    prolog.retractall("ciri_neg(_)")
    start_btn.configure(state=tk.DISABLED)
    yes_btn.configure(state=tk.NORMAL)
    no_btn.configure(state=tk.NORMAL)
    # Mendapatkan daftar pesawat dan ciri
    pesawat = [p["X"].decode() for p in list(prolog.query("pesawat(X)"))]
    for p in pesawat:
        ciri[p] = [g["X"] for g in list(prolog.query(f"ciri(X,\"{p}\")"))]
    index_pesawat = 0
    index_ciri = -1
    pertanyaan_selanjutnya()

def pertanyaan_selanjutnya(ganti_pesawat = False):
    global current_pesawat, current_ciri, index_pesawat, index_ciri
    # Atur index pesawat
    if ganti_pesawat:
    # Ganti ke pesawat selanjutnya
        index_pesawat += 1
        index_ciri = -1
    # Apabila daftar pesawat sudah habis berarti tidak terdeteksi pesawat
    if index_pesawat >= len(pesawat):
        hasil_tebakan()
        return
    
    current_pesawat = pesawat[index_pesawat]
    # Atur index ciri
    index_ciri += 1
    # Apabila semua ciri dari pesawat habis, berarti terdeteksi pesawat tsb
    if index_ciri >= len(ciri[current_pesawat]):
        hasil_tebakan(current_pesawat)
        return
    current_ciri = ciri[current_pesawat][index_ciri]
    
    # Cek status ciri di database prolog
    if list(prolog.query(f"ciri_pos({current_ciri})")):
        pertanyaan_selanjutnya()
        return
    elif list(prolog.query(f"ciri_neg({current_ciri})")):
        pertanyaan_selanjutnya(ganti_pesawat=True)
        return
    # Mendapatkan pertanyaan baru
    pertanyaan = list(prolog.query(f"pertanyaan({current_ciri}, Y)"))[0]["Y"].decode()
    # Set pertanyaan ke kotak pertanyaan
    tampilkan_pertanyaan(pertanyaan)

def tampilkan_pertanyaan(pertanyaan):
    kotak_pertanyaan.configure(state=tk.NORMAL)
    kotak_pertanyaan.delete(1.0, tk.END)
    kotak_pertanyaan.insert(tk.END, pertanyaan)
    kotak_pertanyaan.configure(state=tk.DISABLED)
    
def jawaban(jwb):
    if jwb:
        prolog.assertz(f"ciri_pos({current_ciri})")
        pertanyaan_selanjutnya()
    else:
        prolog.assertz(f"ciri_neg({current_ciri})")
        pertanyaan_selanjutnya(ganti_pesawat=True)
    
def hasil_tebakan(pesawat = ""):
    if pesawat:
        messagebox.showinfo("Hasil tebakan", f"Anda terdeteksi {pesawat}.")
    else:
        messagebox.showinfo("Hasil tebakan", "Tidak terdeteksi pesawat.")
    
    yes_btn.configure(state=tk.DISABLED)
    no_btn.configure(state=tk.DISABLED)
    start_btn.configure(state=tk.NORMAL)

# Inisialisasi window utama
root = tk.Tk()
root.title("Sistem Pakar tebakan pesawat militer")

# Inisialisasi frame utama
mainframe = ttk.Frame(root, padding="3 3 12 12")
mainframe.grid(column=0, row=0, sticky=(tk.N, tk.W, tk.E, tk.S))
root.columnconfigure(0, weight=1)
root.rowconfigure(0, weight=1)

# Membuat widget yang diperlukan
ttk.Label(mainframe, text="Aplikasi tebakan pesawat militer",
font=("Arial", 16)).grid(column=0, row=0, columnspan=3)

ttk.Label(mainframe, text="Kolom Pertanyaan:").grid(column=0, row=1)
kotak_pertanyaan = tk.Text(mainframe, height=4, width=40,state=tk.DISABLED)

kotak_pertanyaan.grid(column=0, row=2, columnspan=3)
no_btn = ttk.Button(mainframe, text="Tidak", state=tk.DISABLED,command=lambda: jawaban(False))

no_btn.grid(column=1, row=3, sticky=(tk.W, tk.E))

yes_btn = ttk.Button(mainframe, text="Ya", state=tk.DISABLED,command=lambda: jawaban(True))

yes_btn.grid(column=2, row=3, sticky=(tk.W, tk.E))
start_btn = ttk.Button(mainframe, text="Mulai Tebakan",command=mulai_tebakan)

start_btn.grid(column=1, row=4, columnspan=2, sticky=(tk.W, tk.E))
# Tambah padding ke setiap widget
for widget in mainframe.winfo_children():
    widget.grid_configure(padx=5, pady=5)
# Menjalankan GUI
root.mainloop()