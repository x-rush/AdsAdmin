// 学生成绩管理MFC版本Dlg.h : header file
//

#if !defined(AFX_MFCDLG_H__262A8052_E27B_4786_BC32_CCEC8D091A7C__INCLUDED_)
#define AFX_MFCDLG_H__262A8052_E27B_4786_BC32_CCEC8D091A7C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMFCDlg dialog

class CMFCDlg : public CDialog
{
// Construction
public:
	CMFCDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CMFCDlg)
	enum { IDD = IDD_MFC_DIALOG };
	CButton	m_b2;
	CEdit	m_cavg;
	CEdit	m_cmax;
	CEdit	m_cmin;
	int		m_studentnum;
	float	m_score;
	float	m_min;
	float	m_max;
	float	m_avg;
	int		m_num;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMFCDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CMFCDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnBUTTON1queren();
	afx_msg void OnBUTTON2luru();
	afx_msg void OnBUTTON5min();
	afx_msg void OnBUTTON4max();
	afx_msg void OnBUTTON3avg();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MFCDLG_H__262A8052_E27B_4786_BC32_CCEC8D091A7C__INCLUDED_)
