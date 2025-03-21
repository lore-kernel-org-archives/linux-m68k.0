Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6744023026F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 19:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742586563; cv=none; b=i3poKmRdCB54Oot6WQSPzBpk7EEANhBAEmpNxwkvlGFX1ogWdxDyAp696MsUZOxHfc96h3Tdc/jrhVJQPjlIREhHAdm0VLVzXe22KbJez0FElPWsirXYCkwKO5yplK+2yoOtiDpKmxvrinndz+zQmopfKrtEw8TekDDnTzLtPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742586563; c=relaxed/simple;
	bh=U65D6SohAEKFKir81pK5H51AE5x6/jUW8l5jaJk9nGM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=tUYhRkLtT6fCdFqsrn0tAnz+xrTJmMBUxr/DVxx4unH6TderZAQfBoc4JzjovAIe5qsOoTSff9at/jhRQH71NjS81kdkB/ATVcCvzAwog1j5bmpRJEMkc0mXgJMdfG0sKb94T2acZ7qIU7JFDNBxaE2hxEvyAUhtFYqn02DaACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4hZrQ1U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4hZrQ1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742586560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
	b=I4hZrQ1UlEDE2VDP/jbj8EGzsMe4ojHQ4H/gWaxNFVUPpphmZLq6tmHLfhIfyaBJnaPsR6
	i4sMvpieWn6yXtOwkic1GhhSoDvoDTdYt1ck1uerR9cz44r/qNMormFnpMW4NV8UQ/2kCs
	dZaeOwm3jQf4d2FgFOF2QnD11/imwvU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-RRvqeB9GO6yrz0LUPB-VRg-1; Fri, 21 Mar 2025 15:49:17 -0400
X-MC-Unique: RRvqeB9GO6yrz0LUPB-VRg-1
X-Mimecast-MFC-AGG-ID: RRvqeB9GO6yrz0LUPB-VRg_1742586556
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac297c79dabso213958966b.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 12:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742586556; x=1743191356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
        b=wB6n1K7zjXTZLvMgOrW/BrMgoab4AHGI/l72b2bGEq5UDBR3+1qbEc7J8y2FDptqTM
         Neh5o/gku+FKEItnhn3wDgRHL38xDpYubyCn12JeKVGfnSiHcMp1jOvsh1f+rN/GEDKb
         CY7wSFNFDkFBli3/xTyaz7hqpHFt/U8MCgdp1nf8RTnTQtSWnf55GmmLRcJqIp1bJvZ5
         ZdValDG5dgamrUzdwzSdd/3tNRDsYqjSzpELrGTPrXQpffgdm0IE+gHRkZh1MjZ5TIsJ
         rsGnlMOxeoU3lLwee9R6ZI0VzRxp+LJKsFGsEXte1SrLcAajUKFwaiz3gnscSk29gIgt
         2wEA==
X-Forwarded-Encrypted: i=1; AJvYcCXBRQ6RlBA+t+9RzaraEY5GMqVePxRDGlhuD4ePHX7clY3oF/Rk0BgzvrjNfNoWTfxATwgyB7zVGxaK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzuvIZ23JsEJ9oMn+4D3vTJBRgKBucIUGM/DvjRTgEfOR1sivan
	reSxAioe8n8mPSyAbuiW9jGz/SDFyv46xxDZKAC1x183gjweWJQy0LTplUuPSOfa0bgSUoq4Xnf
	4tUHI5RRsW40pI9F/lZu7NxGmpM3Y/S4KhoMLkbGL1Dim+uut3UjU8zd/fBPY4ipR
X-Gm-Gg: ASbGncs4sF/KZs2xGJgJzmgUFeeowqGeHIjhEahH1MeNHlB34+NvmhcAUIhWJVRap12
	3n5WCOx1J4oujiYCdUzSWu1x+7n3XDV63voRoeSJCRxq6riKMWXQ6Pc8ljnuPzE3SSH5J31C3z4
	HlFwWeX9iwcAy3OOCdBWtCDvMTtMnYXSczR2YRJIM3p9r/idu15ROeFEOBSwv5imhWVzNQK0O/e
	06u0VLiIwEkT79DrAd9UGhhzij3ZLyueWAKt+AY5z6RHL2GBrTL0zrciryUJNrwGfwIziPCDE0o
	bmFamkru/S3Q4n5OabPjoXG0Z6K1PC/scAckl4v7Ew==
X-Received: by 2002:a17:907:9482:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac3f2537a13mr417247166b.55.1742586555841;
        Fri, 21 Mar 2025 12:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE364/oBuyn+cE4ig5ONss+vPjSo5TWTy9RSOBlsLCFEbZLg0sVEvc8UiI6SNuN3e2vwFGwrA==
X-Received: by 2002:a17:907:9482:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac3f2537a13mr417237066b.55.1742586555219;
        Fri, 21 Mar 2025 12:49:15 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d38sm204412266b.39.2025.03.21.12.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 12:49:13 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Fri, 21 Mar 2025 20:48:41 +0100
Subject: [PATCH v4 2/3] fs: split fileattr/fsxattr converters into helpers
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20250321-xattrat-syscall-v4-2-3e82e6fb3264@kernel.org>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=U65D6SohAEKFKir81pK5H51AE5x6/jUW8l5jaJk9nGM=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIY0u8e2nhsqffE2qNHBdc56kpaBv10/G5zKMBMNU5Y1
 7+08cOt3t6OUhYGMS4GWTFFlnXSWlOTiqTyjxjUyMPMYWUCGcLAxSkAF7Fl+MO39MOayUtjz0Xc
 Zf+S85RBZMPrQyk/IssaWQR3V917GlLI8D93Rvvtmb0TdxnrLdm5326CcYQxW4JKaaBU3XVFNfO
 V51kB1DlIeQ==
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yCpThBE5RYKtJKVuOainc_urW2OCGlGH3FUa6SMGNJQ_1742586556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This will be helpful for get/setfsxattrat syscalls to convert
between fileattr and fsxattr.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/ioctl.c               | 32 +++++++++++++++++++++-----------
 include/linux/fileattr.h |  2 ++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 4434c97bc5dff5a3e8635e28745cd99404ff353e..840283d8c406623d8d26790f89b62ebcbd39e2de 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -538,6 +538,16 @@ int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 }
 EXPORT_SYMBOL(vfs_fileattr_get);
 
+void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx)
+{
+	memset(fsx, 0, sizeof(struct fsxattr));
+	fsx->fsx_xflags = fa->fsx_xflags;
+	fsx->fsx_extsize = fa->fsx_extsize;
+	fsx->fsx_nextents = fa->fsx_nextents;
+	fsx->fsx_projid = fa->fsx_projid;
+	fsx->fsx_cowextsize = fa->fsx_cowextsize;
+}
+
 /**
  * copy_fsxattr_to_user - copy fsxattr to userspace.
  * @fa:		fileattr pointer
@@ -549,12 +559,7 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
 {
 	struct fsxattr xfa;
 
-	memset(&xfa, 0, sizeof(xfa));
-	xfa.fsx_xflags = fa->fsx_xflags;
-	xfa.fsx_extsize = fa->fsx_extsize;
-	xfa.fsx_nextents = fa->fsx_nextents;
-	xfa.fsx_projid = fa->fsx_projid;
-	xfa.fsx_cowextsize = fa->fsx_cowextsize;
+	fileattr_to_fsxattr(fa, &xfa);
 
 	if (copy_to_user(ufa, &xfa, sizeof(xfa)))
 		return -EFAULT;
@@ -563,6 +568,15 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
 }
 EXPORT_SYMBOL(copy_fsxattr_to_user);
 
+void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa)
+{
+	fileattr_fill_xflags(fa, fsx->fsx_xflags);
+	fa->fsx_extsize = fsx->fsx_extsize;
+	fa->fsx_nextents = fsx->fsx_nextents;
+	fa->fsx_projid = fsx->fsx_projid;
+	fa->fsx_cowextsize = fsx->fsx_cowextsize;
+}
+
 static int copy_fsxattr_from_user(struct fileattr *fa,
 				  struct fsxattr __user *ufa)
 {
@@ -571,11 +585,7 @@ static int copy_fsxattr_from_user(struct fileattr *fa,
 	if (copy_from_user(&xfa, ufa, sizeof(xfa)))
 		return -EFAULT;
 
-	fileattr_fill_xflags(fa, xfa.fsx_xflags);
-	fa->fsx_extsize = xfa.fsx_extsize;
-	fa->fsx_nextents = xfa.fsx_nextents;
-	fa->fsx_projid = xfa.fsx_projid;
-	fa->fsx_cowextsize = xfa.fsx_cowextsize;
+	fsxattr_to_fileattr(&xfa, fa);
 
 	return 0;
 }
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 47c05a9851d0600964b644c9c7218faacfd865f8..31888fa2edf10050be134f587299256088344365 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -33,7 +33,9 @@ struct fileattr {
 	bool	fsx_valid:1;
 };
 
+void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx);
 int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa);
+void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa);
 
 void fileattr_fill_xflags(struct fileattr *fa, u32 xflags);
 void fileattr_fill_flags(struct fileattr *fa, u32 flags);

-- 
2.47.2

