  
  ----------------complete table of 2021 FMCG company data-------------------
  select '2021' as [Năm],
		[Masothue] [Mã số thuế],
		[TenDN] [ Tên DN],
		[Mã ngành C5],
		[Co_XNK],
		
		[DN1].[LHDN] [Loại hình DN],-----------from 2019 to 2020 look for value LHDN in table_DN1, otherwise, LHDN2
		[TINH].[Tên] [Tỉnh],
		[Cấp 1],
		[Cấp 2],
		[Cấp 3],
		[Doanhthu_Thuan_BH_CCDV] [DTT],
		[SR_Loinhuan_SauThue] [LNST],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6 [TSLD_khong_gom_HTK],
		(isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6 [No ngan han],
		[SR_Von_ChuSohuu_CK],
		[SR_Nguonvon_Tong_CK],
		[SR_Tien],
		[SR_DautuTC_NH],
		[SR_NoPhaitra_CK]/nullif([SR_Von_ChuSohuu_CK],0) [He so no],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTN],
		[SR_Von_ChuSohuu_CK]/nullif([SR_Nguonvon_Tong_CK],0) [HSTTT],
		[SR_Taisan_NH_CK]/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTNHN],
		[SR_Loinhuan_SauThue] *2 / nullif([SR_Nguonvon_Tong_CK]+[SR_Nguonvon_Tong_DK],0) [ROA],
		[SR_Loinhuan_SauThue] *2/ nullif([SR_Von_ChuSohuu_CK]+[SR_Von_ChuSohuu_DK],0) [ROE],
		[SR_TSCD_CK],
		[SR_LoinhuanGop] /nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [TSLN_gop],
		365*[SR_Phaitra_NBan_NH]/nullif([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK],0) [VQKPTRA],
		365/2*([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK])/nullif([SR_Gia_VonHangban],0) [VQHTK],
		365*[SR_PhaiThu_NH]/nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [VQKPTHU]
from [practice].[dbo].[GSO 2021] [gso]
left join [practice].[dbo].[Mã ngành VISIC] [mn]
on gso.[Mã ngành C5] = mn.[Mã ngành C5 VISIC]
left join [10.1.123.130].[MAPPING].[dbo].[LoaihinhDN_2] [DN1]
ON gso.[LoaihinhDN] =dn1.[MA_LHDN]
left join [10.1.123.130].[MAPPING].[dbo].[GSO_ma_tinh] [TINH]
ON gso.[DNTB_MaTinh] = [TINH].[Mã]
where [Cấp 2] like '%FMCG%'

-----------------------------năm 2020------------------------

with gso_20_format
as
(select [DNTB_MaTinh]
      ,[DNTB_MaHuyen]
      ,[DNTB_MaXa]
      ,[Masothue]
      ,[Masothue2]
      ,[TenDN]
      ,[Diachi]
      ,[Dienthoai]
      ,[Email]
      ,[TinhtrangHD_DN]
      ,[ChuDN_Hoten]
      ,[ChuDN_Namsinh]
      ,[ChuDN_Gioitinh]
      ,[ChuDN_Dantoc]
      ,[ChuDN_Quoctich]
      ,[ChuDN_TDCM]
      ,[LoaihinhKT]
      ,[LoaihinhKT2]
      ,[Tyle_Von_NNTW]
      ,[Tyle_Von_NNDP]
      ,[Tyle_Von_NN]
      ,[Nhanuoc_CoChiphoi]
      ,[Tyle_Von_NuocNgoai]
      ,[Co_Chinhanh]
      ,[Co_VPDD]
      ,[Co_DiadiemSXKD]
      ,[SoLaodong_DauNam]
      ,[SoLaodong_CuoiNam]
      ,[SoLaodong_CuoiNam_Nu]
      ,[SoLaodong_T1_TS]
      ,[SoLaodong_T1_Nu]
      ,[SoLaodong_T2_TS]
      ,[SoLaodong_T2_Nu]
      ,[SoLaodong_T3_TS]
      ,[SoLaodong_T3_Nu]
      ,[SoLaodong_T4_TS]
      ,[SoLaodong_T4_Nu]
      ,[SoLaodong_T5_TS]
      ,[SoLaodong_T5_Nu]
      ,[SoLaodong_T6_TS]
      ,[SoLaodong_T6_Nu]
      ,[SoLaodong_T7_TS]
      ,[SoLaodong_T7_Nu]
      ,[SoLaodong_T8_TS]
      ,[SoLaodong_T8_Nu]
      ,[SoLaodong_T9_TS]
      ,[SoLaodong_T9_Nu]
      ,[SoLaodong_T10_TS]
      ,[SoLaodong_T10_Nu]
      ,[SoLaodong_T11_TS]
      ,[SoLaodong_T11_Nu]
      ,[SoLaodong_T12_TS]
      ,[SoLaodong_T12_Nu]
      ,[Tongtien_Tra_NguoiLD]
      ,[Tongtien_Chi_NguoiLD]
      ,[Tongtien_Donggop]
      ,[Co_DautuXDCB]
      ,[Tongchi_DautuXDCB]
      ,[Co_TuThuchien]
      ,[La_TD_NH_Nuocngoai]
      ,[La_DN_Baohiem]
      ,[TC_Thunhap_Tindung]
      ,[TC_Thunhap_Dichvu]
      ,[TC_Thunhap_KD_Ngoaihoi]
      ,[TC_Thunhap_KD_Khac]
      ,[TC_Thunhap_KD_Chungkhoan]
      ,[TC_Chiphi_Tindung]
      ,[TC_Chiphi_Tindung_Khac]
      ,[TC_Chiphi_KD_Ngoaihoi]
      ,[BH_Doanhthu_Thuan_KDBH]
      ,[BH_ChiBoithuong_TraBaohiem]
      ,[BH_Tanggiam_Duphong]
      ,[BH_Chikhac_KDBH]
      ,[BH_Loinhuan_Taichinh]
      ,[BH_Loinhuan_Dautu_BDS]
      ,[BH_Chiphi_QLDN]
      ,[BH_Chiphi_Banhang]
      ,[Co_Dien]
      ,[Co_Than]
      ,[Co_Dautho]
      ,[Co_Xang]
      ,[Co_DauNhienlieu]
      ,[Co_LPG]
      ,[Co_Khi]
      ,[Co_NhienlieuSinhhoc]
      ,[Co_Internet]
      ,[Internet_DichvuCong]
      ,[Internet_ThuongmaiDientu]
      ,[Internet_GiaodichKhac]
      ,[Internet_GioithieuSanpham]
      ,[Co_Website]
      ,[Website]
      ,[Co_SDPhanmem]
      ,[Co_SDPhanmemQL]
      ,[Co_ChiPhanmem]
      ,[Tongchi_Phanmem]
      ,[Chi_ThueMua_Phanmem]
      ,[Co_Tudonghoa]
      ,[Co_DMST]
      ,[DMST_TuThuchien]
      ,[DMST_ThueNgoai]
      ,[DMST_Sanpham]
      ,[DMST_MohinhTochuc]
      ,[DMST_QuytrinhSXKD]
      ,[Co_GiacongLaprap]
      ,[Co_XNK]
      ,[XNK_Hanghoa]
      ,[XNK_Dichvu]
      ,[Co_ChuDN_LaNu]
      ,[Co_NguoiQuanly_LaNu]
      ,[Co_Tyle_VDL_Tren51]
      ,[TSC_Laodong_Quanly_BQ]
      ,[TSC_Chiphi_Quanly]
      ,[TSC_CoTructiepSXKD]
      ,[TSC_Trangthai]
      ,[TSC_CoThem_Diadiem]
      ,[CoThem_Chinhanh_VPDD]
      ,[Trangthai]
      ,[DN_Doanhthu_Thuan_BH_CCDV]
      ,[La_DN_DuocChonMau_ChuyenNganh]
      ,format(convert(int,[MaNganhC5_Chinh]),'00000','en-US') [Mã ngành C5]
      ,[MaNganhC4]
      ,[Khuvuc]
      ,[NhomLaodong]
      ,[SR_Taisan_Tong_DK]
      ,[SR_Taisan_Tong_CK]
      ,[SR_Taisan_NH_DK]
      ,[SR_Taisan_NH_CK]
      ,[SR_Tonkho_DK]
      ,[SR_Tonkho_CK]
      ,[SR_Taisan_DH_DK]
      ,[SR_Taisan_DH_CK]
      ,[SR_TSCD_Nguyengia_DK]
      ,[SR_TSCD_Nguyengia_CK]
      ,[SR_TSCD_HMLK_DK]
      ,[SR_TSCD_HMLK_CK]
      ,[SR_TSCD_Huuhinh_DK]
      ,[SR_TSCD_Huuhinh_CK]
      ,[SR_TSCD_ThueTC_DK]
      ,[SR_TSCD_ThueTC_CK]
      ,[SR_TSCD_Vohinh_DK]
      ,[SR_TSCD_Vohinh_CK]
      ,[SR_TSCD_Huuhinh_Nguyengia_DK]
      ,[SR_TSCD_Huuhinh_Nguyengia_CK]
      ,[SR_TSCD_ThueTC_Nguyengia_DK]
      ,[SR_TSCD_ThueTC_Nguyengia_CK]
      ,[SR_TSCD_Vohinh_Nguyengia_DK]
      ,[SR_TSCD_Vohinh_Nguyengia_CK]
      ,[SR_TSCD_Huuhinh_HMLK_DK]
      ,[SR_TSCD_Huuhinh_HMLK_CK]
      ,[SR_TSCD_ThueTC_HMLK_DK]
      ,[SR_TSCD_ThueTC_HMLK_CK]
      ,[SR_TSCD_Vohinh_HMLK_DK]
      ,[SR_TSCD_Vohinh_HMLK_CK]
      ,[SR_Chiphi_XDCB_Dodang_DK]
      ,[SR_Chiphi_XDCB_Dodang_CK]
      ,[SR_Nguonvon_Tong_DK]
      ,[SR_Nguonvon_Tong_CK]
      ,[SR_Von_ChuSohuu_DK]
      ,[SR_Von_ChuSohuu_CK]
      ,[SR_Doanhthu_BH_CCDV]
      ,[SR_Giamtru_Doanhthu]
      ,[SR_Doanhthu_Thuan_BH_CCDV]
      ,[SR_Gia_VonHangban]
      ,[SR_Doanhthu_HDTC]
      ,[SR_Thunhap_Khac]
      ,[SR_Loinhuan_TruocThue]
      ,[SR_Chiphi_Thue_TNDN]
      ,[SR_TSCD_DK]
      ,[SR_TSCD_CK]
      ,[SR_NoPhaitra_DK]
      ,[SR_NoPhaitra_CK]
      ,[SR_ChiThueHL]
      ,[SR_LoinhuanGop]
      ,[SR_Chi_TC]
      ,[SR_Chi_TC_LV]
      ,[SR_Chi_BHang]
      ,[SR_Chi_QLDN]
      ,[SR_Loinhuan_Thuan]
      ,[SR_Chi_Khac]
      ,[SR_Loinhuan_Khac]
      ,[SR_Loinhuan_SauThue]
      ,[SR_Lai_CPhieu]
      ,[SR_Tien]
      ,[SR_DautuTC_NH]
      ,[SR_PhaiThu_NH]
      ,[SR_PhaiThu_NH_KH]
      ,[SR_Tratruoc_NBan_NH]
      ,[SR_BDS_Dautu]
      ,[SR_BDS_Dautu_NGia]
      ,[SR_BDS_Dautu_HMLK]
      ,[SR_Taisan_DH_Khac]
      ,[SR_Phaitra_NBan_NH]
      ,[SR_NMua_Tratruoc_NH]
      ,[SR_Thue]
      ,[SR_PhaiTra_NguoiLD]
      ,[SR_VayNoTC_NH]
      ,[SR_DP_Phaitra_NH]
      ,[SR_VonGop_ChuSH]
      ,[SR_LoinhuanST_ChuaPP]
      ,[SR_Chiphi_QLKD]
      ,[BCTC_Doanhthu_Thuan_BH_CCDV]
      ,[nganh_c2_20]
      ,[LHDN20]
      ,[nganhC1_20]
      ,[nganh3KV_20]
  FROM [10.1.123.130].[CLKD].[dbo].[DATA_GSO_2020]
  )
select '2020' as [Năm],
		[masothue] [Mã số thuế],
		[tenDN] [Tên DN],
		[Mã ngành C5],
		[Co_xnk],
		d.[LHDN],
		t.[Tên],
		v.[Cấp 1],
		v.[Cấp 2],
		v.[Cấp 3],
		[BCTC_Doanhthu_Thuan_BH_CCDV] [DTT],
		[SR_Loinhuan_SauThue] [LNST],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6 [TSLD_khong_gom_HTK],
		(isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6 [No ngan han],
		[SR_Von_ChuSohuu_CK],
		[SR_Nguonvon_Tong_CK],
		[SR_Tien],
		[SR_DautuTC_NH],
		[SR_NoPhaitra_CK]/nullif([SR_Von_ChuSohuu_CK],0) [He so no],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTN],
		[SR_Von_ChuSohuu_CK]/nullif([SR_Nguonvon_Tong_CK],0) [HSTTT],
		[SR_Taisan_NH_CK]/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTNHN],
		[SR_Loinhuan_SauThue] *2 / nullif([SR_Nguonvon_Tong_CK]+[SR_Nguonvon_Tong_DK],0) [ROA],
		[SR_Loinhuan_SauThue] *2/ nullif([SR_Von_ChuSohuu_CK]+[SR_Von_ChuSohuu_DK],0) [ROE],
		[SR_TSCD_CK],
		[SR_LoinhuanGop] /nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [TSLN_gop],
		365*[SR_Phaitra_NBan_NH]/nullif([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK],0) [VQKPTRA],
		365/2*([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK])/nullif([SR_Gia_VonHangban],0) [VQHTK],
		365*[SR_PhaiThu_NH]/nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [VQKPTHU]
from gso_20_format [g]
left join [10.1.123.130].[MAPPING].[dbo].[LoaihinhDN] [d]
on g.[loaihinhkt] = d.[MA_LHDN]
left join [10.1.123.130].[MAPPING].[dbo].[GSO_ma_tinh] [t]
ON g.[DNTB_MaTinh] = t.[Mã]
left join [practice].[dbo].[Mã ngành VISIC] [v]
on g.[Mã ngành C5] = v.[Mã ngành C5 VISIC]
where v.[Cấp 2] like '%FMCG%'
		

-----------------------------năm 2019------------------------

select '2019' as [Năm],
		[masothue] [Mã số thuế],
		[tenDN] [Tên DN],
		[manganhc4] [Mã ngành C4],
		[Co_XNK],
		d.[LHDN],
		t.[Tên],
		v.[Cấp 1],
		v.[Cấp 2],
		v.[Cấp 3],
		[BCTC_Doanhthu_Thuan_BH_CCDV] [DTT],
		[SR_Loinhuan_SauThue] [LNST],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6 [TSLD_khong_gom_HTK],
		(isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6 [No ngan han],
		[SR_Von_ChuSohuu_CK],
		[SR_Nguonvon_Tong_CK],
		[SR_Tien],
		[SR_DautuTC_NH],
		[SR_NoPhaitra_CK]/nullif([SR_Von_ChuSohuu_CK],0) [He so no],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTN],
		[SR_Von_ChuSohuu_CK]/nullif([SR_Nguonvon_Tong_CK],0) [HSTTT],
		[SR_Taisan_NH_CK]/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTNHN],
		[SR_Loinhuan_SauThue] *2 / nullif([SR_Nguonvon_Tong_CK]+[SR_Nguonvon_Tong_DK],0) [ROA],
		[SR_Loinhuan_SauThue] *2/ nullif([SR_Von_ChuSohuu_CK]+[SR_Von_ChuSohuu_DK],0) [ROE],
		[SR_TSCD_CK],
		[SR_LoinhuanGop] /nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [TSLN_gop],
		365*[SR_Phaitra_NBan_NH]/nullif([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK],0) [VQKPTRA],
		365/2*([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK])/nullif([SR_Gia_VonHangban],0) [VQHTK],
		365*[SR_PhaiThu_NH]/nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [VQKPTHU]
from [10.1.123.130].[CLKD].[dbo].[DATA_GSO_2020] [g]
left join [10.1.123.130].[MAPPING].[dbo].[LoaihinhDN] [d]
on g.[loaihinhkt] = d.[MA_LHDN]
left join [10.1.123.130].[MAPPING].[dbo].[GSO_ma_tinh] [t]
ON g.[DNTB_MaTinh] = t.[Mã]
left join [practice].[dbo].[Mã ngành VISIC] [v]
on g.[manganhc4] = v.[Mã ngành C4 VISIC]
where v.[Cấp 2] like '%FMCG%'

---------------------------------------------------FMCG_F&B-------------------------------------------------------------------------
	   ----------------complete table of 2021 FMCG company data-------------------
  with FB as (
  select '2021' as [Năm],
		[Masothue] [Mã số thuế],
		[TenDN] [ Tên DN],
		[Mã ngành C5],
		[Co_XNK],
		
		[DN1].[LHDN] [Loại hình DN],-----------from 2019 to 2020 look for value LHDN in table_DN1, otherwise, LHDN2
		[TINH].[Tên] [Tỉnh],
		[Cấp 1],
		[Cấp 2],
		[Cấp 3],
		[Doanhthu_Thuan_BH_CCDV] [DTT],
		[SR_Loinhuan_SauThue] [LNST],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6 [TSLD_khong_gom_HTK],
		(isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6 [No ngan han],
		[SR_Von_ChuSohuu_CK],
		[SR_Nguonvon_Tong_CK],
		[SR_Tien],
		[SR_DautuTC_NH],
		[SR_NoPhaitra_CK]/nullif([SR_Von_ChuSohuu_CK],0) [He so no],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTN],
		[SR_Von_ChuSohuu_CK]/nullif([SR_Nguonvon_Tong_CK],0) [HSTTT],
		[SR_Taisan_NH_CK]/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTNHN],
		[SR_Loinhuan_SauThue] *2 / nullif([SR_Nguonvon_Tong_CK]+[SR_Nguonvon_Tong_DK],0) [ROA],
		[SR_Loinhuan_SauThue] *2/ nullif([SR_Von_ChuSohuu_CK]+[SR_Von_ChuSohuu_DK],0) [ROE],
		[SR_TSCD_CK],
		[SR_LoinhuanGop] /nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [TSLN_gop],
		365*[SR_Phaitra_NBan_NH]/nullif([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK],0) [VQKPTRA],
		365/2*([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK])/nullif([SR_Gia_VonHangban],0) [VQHTK],
		365*[SR_PhaiThu_NH]/nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [VQKPTHU]
from [practice].[dbo].[GSO 2021] [gso]
left join [practice].[dbo].[Mã ngành VISIC] [mn]
on gso.[Mã ngành C5] = mn.[Mã ngành C5 VISIC]
left join [10.1.123.130].[MAPPING].[dbo].[LoaihinhDN_2] [DN1]
ON gso.[LoaihinhDN] =dn1.[MA_LHDN]
left join [10.1.123.130].[MAPPING].[dbo].[GSO_ma_tinh] [TINH]
ON gso.[DNTB_MaTinh] = [TINH].[Mã]
where [Cấp 2] like '%FMCG%'

-----------------------------năm 2020------------------------
union all

select '2020' as [Năm],
		[masothue] [Mã số thuế],
		[tenDN] [Tên DN],
		[Mã ngành C5],
		[Co_xnk],
		d.[LHDN],
		t.[Tên],
		v.[Cấp 1],
		v.[Cấp 2],
		v.[Cấp 3],
		[BCTC_Doanhthu_Thuan_BH_CCDV] [DTT],
		[SR_Loinhuan_SauThue] [LNST],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6 [TSLD_khong_gom_HTK],
		(isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6 [No ngan han],
		[SR_Von_ChuSohuu_CK],
		[SR_Nguonvon_Tong_CK],
		[SR_Tien],
		[SR_DautuTC_NH],
		[SR_NoPhaitra_CK]/nullif([SR_Von_ChuSohuu_CK],0) [He so no],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTN],
		[SR_Von_ChuSohuu_CK]/nullif([SR_Nguonvon_Tong_CK],0) [HSTTT],
		[SR_Taisan_NH_CK]/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTNHN],
		[SR_Loinhuan_SauThue] *2 / nullif([SR_Nguonvon_Tong_CK]+[SR_Nguonvon_Tong_DK],0) [ROA],
		[SR_Loinhuan_SauThue] *2/ nullif([SR_Von_ChuSohuu_CK]+[SR_Von_ChuSohuu_DK],0) [ROE],
		[SR_TSCD_CK],
		[SR_LoinhuanGop] /nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [TSLN_gop],
		365*[SR_Phaitra_NBan_NH]/nullif([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK],0) [VQKPTRA],
		365/2*([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK])/nullif([SR_Gia_VonHangban],0) [VQHTK],
		365*[SR_PhaiThu_NH]/nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [VQKPTHU]
from GSO_2020 [g]
left join [10.1.123.130].[MAPPING].[dbo].[LoaihinhDN] [d]
on g.[loaihinhkt] = d.[MA_LHDN]
left join [10.1.123.130].[MAPPING].[dbo].[GSO_ma_tinh] [t]
ON g.[DNTB_MaTinh] = t.[Mã]
left join [practice].[dbo].[Mã ngành VISIC] [v]
on g.[Mã ngành C5] = v.[Mã ngành C5 VISIC]
where v.[Cấp 2] like '%FMCG%'
		
union all
-----------------------------năm 2019------------------------

select '2019' as [Năm],
		[masothue] [Mã số thuế],
		[tenDN] [Tên DN],
		[manganhc4] [Mã ngành C4],
		[Co_XNK],
		d.[LHDN],
		t.[Tên],
		v.[Cấp 1],
		v.[Cấp 2],
		v.[Cấp 3],
		[BCTC_Doanhthu_Thuan_BH_CCDV] [DTT],
		[SR_Loinhuan_SauThue] [LNST],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6 [TSLD_khong_gom_HTK],
		(isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6 [No ngan han],
		[SR_Von_ChuSohuu_CK],
		[SR_Nguonvon_Tong_CK],
		[SR_Tien],
		[SR_DautuTC_NH],
		[SR_NoPhaitra_CK]/nullif([SR_Von_ChuSohuu_CK],0) [He so no],
		(isnull(SR_Tien,0) + isnull(SR_DautuTC_NH,0) + isnull(SR_PhaiThu_NH,0))*1e6/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTN],
		[SR_Von_ChuSohuu_CK]/nullif([SR_Nguonvon_Tong_CK],0) [HSTTT],
		[SR_Taisan_NH_CK]/nullif((isnull(SR_Phaitra_NBan_NH,0) + isnull([SR_NMua_Tratruoc_NH],0)  + isnull([SR_Thue],0) + isnull([SR_PhaiTra_NguoiLD],0) + isnull([SR_VayNoTC_NH],0) + isnull([SR_DP_Phaitra_NH],0))*1e6,0) [HSTTNHN],
		[SR_Loinhuan_SauThue] *2 / nullif([SR_Nguonvon_Tong_CK]+[SR_Nguonvon_Tong_DK],0) [ROA],
		[SR_Loinhuan_SauThue] *2/ nullif([SR_Von_ChuSohuu_CK]+[SR_Von_ChuSohuu_DK],0) [ROE],
		[SR_TSCD_CK],
		[SR_LoinhuanGop] /nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [TSLN_gop],
		365*[SR_Phaitra_NBan_NH]/nullif([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK],0) [VQKPTRA],
		365/2*([SR_Gia_VonHangban]+[SR_Tonkho_CK]-[SR_Tonkho_DK])/nullif([SR_Gia_VonHangban],0) [VQHTK],
		365*[SR_PhaiThu_NH]/nullif([SR_Doanhthu_Thuan_BH_CCDV],0) [VQKPTHU]
from [10.1.123.130].[CLKD].[dbo].[DATA_GSO_2020] [g]
left join [10.1.123.130].[MAPPING].[dbo].[LoaihinhDN] [d]
on g.[loaihinhkt] = d.[MA_LHDN]
left join [10.1.123.130].[MAPPING].[dbo].[GSO_ma_tinh] [t]
ON g.[DNTB_MaTinh] = t.[Mã]
left join [practice].[dbo].[Mã ngành VISIC] [v]
on g.[manganhc4] = v.[Mã ngành C4 VISIC]
where v.[Cấp 2] like '%FMCG%'
)
select [Năm], [Mã số thuế], [ Tên DN], FB.[Mã ngành C5], [Co_XNK], [Loại hình DN],f1.[Tiểu ngành FMCG], f1.[Nhóm], [Tỉnh], [Cấp 1],[Cấp 2],[Cấp 3],DTT, LNST, TSLD_khong_gom_HTK,[No ngan han], SR_Von_ChuSohuu_CK, SR_Nguonvon_Tong_CK, SR_Tien, SR_DautuTC_NH, [He so no], HSTTN, HSTTT, HSTTNHN, ROA, ROE, SR_TSCD_CK, TSLN_gop,VQKPTRA, VQHTK, VQKPTHU
from FB 
left join [practice].[dbo].[F&B_map] [f1]
on FB.[Mã ngành C5] = f1.[Mã ngành C5]
where f1.[Tiểu ngành FMCG] is not null
	  
	  
----------------------------------------------------NHS-CASA----------------------------------------------------------------------------
---------------CASA BQ THÁNG NĂM 2023 (TỪ 50K ĐẾN DƯỚI 10TR) KHCN
select (N'Tháng ' +substring([Rpt_date],5,2)) [Tháng],
		count(distinct [Mã KH]) [Số lượng KH],
		avg([Số dư BQ quy đổi]) [Số dư bình quân]
From (
		select [Rpt_date], [Mã KH], [Số dư BQ quy đổi], [LoaiSp]
		from [10.1.123.130].[BI_DATA].[dbo].[AC_101] a
		left join [10.1.123.130].[MAPPING].[dbo].[SP_dacthu] s
		on a. [Tên Sản phẩm] = s. [TenSP]
		where [LoaiSp] ='CASA' and [Rpt_date] >= '20230131' and [Nhóm Khách hàng] = 'Cá nhân'
		and [Số dư BQ quy đổi] between 50000 and 10000000 
		) [table]
group by (N'Tháng ' +substring([Rpt_date],5,2))
order by (N'Tháng ' +substring([Rpt_date],5,2))

----------------filter sum(số dư BQ) CASA BQ THÁNG NĂM 2023 (TỪ 50K ĐẾN DƯỚI 10TR) KHCN
select (N'Tháng ' +substring([Rpt_date],5,2)) [Tháng],
		count(distinct [Mã KH]) [Số lượng KH],
		(sum([Số dư BQ quy đổi])/count(distinct [Mã KH])) [Số dư bình quân]
From (
		select [Rpt_date], [Mã KH], [Số dư BQ quy đổi], [LoaiSp]
		from [10.1.123.130].[BI_DATA].[dbo].[AC_101] a
		left join [10.1.123.130].[MAPPING].[dbo].[SP_dacthu] s
		on a. [Tên Sản phẩm] = s. [TenSP]
		where [LoaiSp] ='CASA' and [Rpt_date] >= '20230131' and [Nhóm Khách hàng] = 'Cá nhân'
		) [table]

group by (N'Tháng ' +substring([Rpt_date],5,2))
having sum([Số dư BQ quy đổi]) between 50000 and 10000000
order by (N'Tháng ' +substring([Rpt_date],5,2))
---------------CASA BQ THÁNG NĂM 2023 (TỪ 0K ĐẾN DƯỚI 10TR) KHCN

select (N'Tháng '+ substring([Rpt_date],5,2)) [Tháng],
		count(distinct [Mã KH]) [Số lượng KH],
		avg([Số dư BQ quy đổi]) [Số dư BQ]
From (
		select [Rpt_date], [Mã KH], [Số dư BQ quy đổi], [LoaiSp]
		from [10.1.123.130].[BI_DATA].[dbo].[AC_101] a
		left join [10.1.123.130].[MAPPING].[dbo].[SP_dacthu] s
		on a. [Tên Sản phẩm] = s. [TenSP]
		where [LoaiSp] ='CASA' and [Rpt_date] >= '20230131' and [Nhóm Khách hàng] = 'Cá nhân'
		and [Số dư BQ quy đổi] < 10000000
		) [table]
group by (N'Tháng '+ substring([Rpt_date],5,2))
order by (N'Tháng '+ substring([Rpt_date],5,2)) 

-------FD dưới 100tr trong năm 2023 KHCN
select (N'Tháng ' + substring([Rpt_date],5,2)) [Tháng],
		count(distinct [Mã KH]) [Số lượng KH]
From (
		select [Rpt_date], [Mã KH], [LoaiSp]
		from [10.1.123.130].[BI_DATA].[dbo].[AC_101] a
		left join [10.1.123.130].[MAPPING].[dbo].[SP_dacthu] s
		on a. [Tên Sản phẩm] = s. [TenSP]
		where [LoaiSp] ='FD' and [Rpt_date] >= '20230131' and [Nhóm Khách hàng] = 'Cá nhân'
		and [Số dư BQ quy đổi] < 100000000
		) [fd]
group by (N'Tháng ' + substring([Rpt_date],5,2))
