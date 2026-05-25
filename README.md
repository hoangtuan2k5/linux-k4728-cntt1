# Bài Thực Hành: Student Backup System

**Sinh viên thực hiện:** Hoàng Tuấn  
**Mã sinh viên:** 2300536

Đây là dự án bash script thực hiện tự động sao lưu dữ liệu, kiểm tra hệ thống và ghi log, có tích hợp menu tương tác trên Terminal.

## Cấu trúc thư mục

```text
student_backup_system/
├── data/       # Chứa các file dữ liệu mẫu cần backup
├── backups/    # Nơi lưu trữ các file nén (.tar.gz) sau khi backup
├── logs/       # Nơi lưu trữ file backup.log
└── scripts/    # Chứa mã nguồn của chương trình (auto_backup.sh)
```

## Tính năng chính

1. Tự động kiểm tra và tạo thư mục `backups` nếu chưa tồn tại.
2. Nén toàn bộ dữ liệu trong thư mục `data/` thành định dạng file `.tar.gz` và lưu trữ vào `backups/`.
3. Lưu vết lịch sử và thời gian thực hiện backup vào file `logs/backup.log`.
4. Kiểm tra trạng thái mạng liên tục bằng lệnh kiểm tra kết nối Internet (ping).
5. Tích hợp Menu điều khiển cho thao tác nhanh gọn:
   - Backup dữ liệu
   - Xem danh sách backup
   - Xem log
   - Thoát

## Tính năng mở rộng (Bonus)

- Giới hạn lưu trữ thông minh: Tự động xóa các bản sao lưu cũ, chỉ giữ lại đúng 5 file backup mới nhất.
- Tự động hóa Version Control: Hỗ trợ tự động đẩy (push) mã nguồn dự án lên GitHub.
- Giao diện console cải tiến: Menu có đầy đủ màu sắc, giúp phân biệt rõ ràng các thông báo.

## Hướng dẫn Cài đặt & Sử dụng

1. Vào thư mục làm việc và cấp quyền thực thi cho file script:
```bash
chmod +x scripts/auto_backup.sh
```

2. Chạy chương trình từ Terminal:
```bash
./scripts/auto_backup.sh
```

## Thiết lập Cronjob (Chạy ngầm và tự động)

Để thiết lập dự án tự động backup dữ liệu mỗi 5 phút một lần, bạn có thể đưa kịch bản vào crontab:

1. Mở cửa sổ cấu hình cronjob:
```bash
crontab -e
```

2. Thêm dòng sau vào danh sách (Sửa lại đường dẫn tuyệt đối cho đúng trên máy bạn):
```bash
*/5 * * * * /đường/dẫn/tuyệt/đối/tới/scripts/auto_backup.sh
```

## Thư mục nộp bài

(Ghi chú dành cho sinh viên - Hãy thay thế/bổ sung các hình ảnh vào trực tiếp README này hoặc lưu thành một thư mục riêng trước khi nộp bài)
- [ ] Link GitHub repository.
- [ ] Ảnh chụp cấu trúc thư mục.
- [ ] Ảnh chụp kết quả chạy script.
- [ ] Ảnh chụp cấu hình dòng lệnh Cronjob.
- [ ] Ảnh chụp giao diện Repository GitHub.
