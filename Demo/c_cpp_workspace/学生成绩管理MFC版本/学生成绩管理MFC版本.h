// 学生成绩管理MFC版本.h : main header file for the 学生成绩管理MFC版本 application
//

#if !defined(AFX_MFC_H__68D9CECD_DE3D_40C0_A64C_4CE7CB12A3BD__INCLUDED_)
#define AFX_MFC_H__68D9CECD_DE3D_40C0_A64C_4CE7CB12A3BD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CMFCApp:
// See 学生成绩管理MFC版本.cpp for the implementation of this class
//

class CMFCApp : public CWinApp
{
public:
	CMFCApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMFCApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CMFCApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MFC_H__68D9CECD_DE3D_40C0_A64C_4CE7CB12A3BD__INCLUDED_)
