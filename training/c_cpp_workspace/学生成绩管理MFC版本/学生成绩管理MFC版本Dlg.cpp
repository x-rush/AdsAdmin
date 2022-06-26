// 学生成绩管理MFC版本Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "学生成绩管理MFC版本.h"
#include "学生成绩管理MFC版本Dlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About
class Student{
public:
     float score;
} students[1000];

int StudentsNum=0;
float sum=0.0,max,min;
class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMFCDlg dialog

CMFCDlg::CMFCDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMFCDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMFCDlg)
	m_studentnum = 0;
	m_score = 0.0f;
	m_min = 0.0f;
	m_max = 0.0f;
	m_avg = 0.0f;
	m_num = 0;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CMFCDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMFCDlg)
	DDX_Control(pDX, IDC_BUTTON2luru, m_b2);
	DDX_Control(pDX, IDC_EDIT5avg, m_cavg);
	DDX_Control(pDX, IDC_EDIT6max, m_cmax);
	DDX_Control(pDX, IDC_EDIT7min, m_cmin);
	DDX_Text(pDX, IDC_EDIT4renshu, m_studentnum);
	DDX_Text(pDX, IDC_EDIT3chengji, m_score);
	DDX_Text(pDX, IDC_EDIT7min, m_min);
	DDX_Text(pDX, IDC_EDIT6max, m_max);
	DDX_Text(pDX, IDC_EDIT5avg, m_avg);
	DDX_Text(pDX, IDC_EDIT2xuhao, m_num);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CMFCDlg, CDialog)
	//{{AFX_MSG_MAP(CMFCDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1queren, OnBUTTON1queren)
	ON_BN_CLICKED(IDC_BUTTON2luru, OnBUTTON2luru)
	ON_BN_CLICKED(IDC_BUTTON5min, OnBUTTON5min)
	ON_BN_CLICKED(IDC_BUTTON4max, OnBUTTON4max)
	ON_BN_CLICKED(IDC_BUTTON3avg, OnBUTTON3avg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMFCDlg message handlers

BOOL CMFCDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CMFCDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CMFCDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CMFCDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CMFCDlg::OnBUTTON1queren() 
{
	// TODO: Add your control notification handler code here
	this->UpdateData(1);
	if(m_studentnum<1)
	{
		m_studentnum=1;
		MessageBox("学生人数小于1");
	}
	    StudentsNum=m_studentnum;
		    m_num=1;
		max=-1;
		min=0xfffffffff;
}

void CMFCDlg::OnBUTTON2luru() 
{	
	// TODO: Add your control notification handler code here
	this->UpdateData(1);
	this->UpdateData(1);
	students[m_num-1].score=m_score;
	sum+=m_score;
	if(min>m_score) min=m_score;
	if(max<m_score) max=m_score;
	m_num++;
	m_score=NULL;
	if(m_num>StudentsNum){
		    m_b2.EnableWindow(0);
    }
	this->UpdateData(0);
}

void CMFCDlg::OnBUTTON5min() 
{
	// TODO: Add your control notification handler code here
	this->UpdateData(1);
	m_min=min;
	m_cmin.EnableWindow(0);
	this->UpdateData(0);
}

void CMFCDlg::OnBUTTON4max() 
{
	// TODO: Add your control notification handler code here
	this->UpdateData(1);
	m_max=max;
	m_cmax.EnableWindow(0);
	this->UpdateData(0);
}

void CMFCDlg::OnBUTTON3avg() 
{
	// TODO: Add your control notification handler code here
	this->UpdateData(1);
	m_avg=sum/StudentsNum;
	m_cavg.EnableWindow(0);
	this->UpdateData(0);
}
