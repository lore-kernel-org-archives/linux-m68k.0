Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792FA192D8A
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725973; cv=none; b=HkKQ7Jju6kCGIBAjeim+BGnJSU2QH4IsSUwis0eyUt5GvNAVgJyFdW6ZDmz/yKZUfq4OTxbs0inD/JI7NmJJka32f5E1SDzY4qSkupKS9DeBKQGRM79MxYC47/LELDXt+AS4PDjGlQ28HlTMg0WvcJebYRGg0FKc2LllBXzDU8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725973; c=relaxed/simple;
	bh=5w1rh0L6NznGkqOB1ptiKwAFOGZfY5CoA2D4m8g2/Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHLw6zG7ZrDYh1asROaPTKKb9WM1uaCSJGoqb8jtdbW2VulhBYksyomiOrXEcJ0JokqYtgC4tfzdwEiFYk2qgqSfbKeC1l+lMzzHTvVxSHPO0P1Cvf7AUWf01HXjD7IK5/4cT1PX7NIQgw9Z/Vgva3BGwZ87gW/gtTStwuuSVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV31JzHH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV31JzHH"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0418f6fc27so430868166b.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725970; x=1758330770; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=lV31JzHHEY+wxUmk0It58I3FFJx9v0ZmN2t9t8mk4jhbX9pig+/TQsvchwVjncYJXc
         AEPvhZPNL0cSk7J/WqeSrrvgab+Og+zv+TpJsTIPRoBK/MaSh16AswaLBGmVviy7mK5K
         XkyS9i6htbHwbPG+Aptcr6Z+lvLAPM/UhF/tD4S60Yzn659GHmwnZCO3kdqjmf2nnhik
         0iVzacXAfqCTz+gssOBybWxAUs8cVjIV+dTqL+WBeB68t/vRJ6lxeA8e27MtCyqQS6jH
         Nr71kWMFx4chjzCbsAEfe1GQ4hSyR2EY1vzqS/yBMItPtMqCp+grsu2bGOsTV4Qym8k6
         PqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725970; x=1758330770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=TAL5Yi7fw0rXOC/mTwJUSqeElOyR0g1oaSr5IvNNUySJMuyb1nqeV8dcNjQHKgxwIW
         53MEM0/FmPrjZO6BdERquWZthMN42TMbuku3Hq35mZJj2Ze+R8hVTenNw6zLN5RO4oYS
         zxYlHfigKMVZwg+9/k7YY/LB8TzY/TpUIqDV5TxVRafzHYC3xVxeV4+oQoKL4Tg88am/
         dYHg8musDKbyQJeJy6rab2sdAFFVVOH8/fMbp8uw4WuPSE6KU/biN22PsLRBT7+2PVNg
         bhA2AUkDSvIM0xzYmh4icGXJlsif1NJQB4OhR5Cnte6ARTaJZoejQvFm2oAoziv1DBlT
         kHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV08+nvsv4BjUcjIR7K8yLYfc2tNjxhCFeagobH7G0awEjRETkOXLB8J48XL+a8Y+kRwYgY8sXdlBp9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YymZPXGz6v6KwI1pEZKb8wZR9pcAR2TW08JCo6MU2oX/nLYcbRc
	8rmu6pilWt9KJqDLTu8orEj562uU31bJINh6QysFDRmGxK8FMNf39aaA
X-Gm-Gg: ASbGncurgSnOvQMSuIdGclbk8QgTvtMgWGZKqXEzoKdFX8VglDl8Ufs7tFKNMjZS6LV
	KfzYADd12G+qqXtseFLj7KrthyhBYt4kJaeD9Po7zJuOyKfrZvw3Y7/NM+vIJ7apKRgj81wdqdv
	pNpEiBTchZN8tEpaxMlOSM02H3YVnRX9R+fTYTlLCd4+mEFSHn2ZIi63RUcZypjBQo5ubbbvEwM
	to+L7l7jVQ46FIQNAxK2ddxI6GGFzUMWgbQUVTHbN7HUN+cBwXMNwVBthelB9VM++Xr9Lx340JQ
	1tZzpTMOhpD5DMoPRPdd+fTG9uusQZRghxFl4cGn8O3DDRK7IpsRfl1gjhXoch/gGsqGKIVLuIW
	2cmXHY1mTMslNx953qtjr1w38RpKiXXcetUmWIBte
X-Google-Smtp-Source: AGHT+IExCbHobezsJZBylPatDCb3rXiTmvHjuHynF55nxxCc14bpP2oPLB71sx+Li40Hkl4GjqRelQ==
X-Received: by 2002:a17:907:97d2:b0:b04:31c6:a434 with SMTP id a640c23a62f3a-b07c324cf12mr467235966b.0.1757725969783;
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da327sm479612566b.11.2025.09.12.18.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 30/62] doc: remove documentation for block device 4 0
Date: Sat, 13 Sep 2025 00:38:09 +0000
Message-ID: <20250913003842.41944-31-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It doesn't work. I tested this both in system booted
using initramfs and in system booted from real root
device directly

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/devices.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 27835389ca49..6ce0940233a8 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -138,12 +138,6 @@
 		number for BSD PTY devices.  As of Linux 2.1.115, this
 		is no longer supported.	 Use major numbers 2 and 3.
 
-   4 block	Aliases for dynamically allocated major devices to be used
-		when its not possible to create the real device nodes
-		because the root filesystem is mounted read-only.
-
-		   0 = /dev/root
-
    5 char	Alternate TTY devices
 		  0 = /dev/tty		Current TTY device
 		  1 = /dev/console	System console
-- 
2.47.2

