Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF5381AA
	for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Feb 2025 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740184453; cv=none; b=iB5lQPZHSjaOKppflMeSRgRr4SKsLCz+wJ3tV6T1QBWBkaXQ+ma0c0lF7hwNp0jj1oaQ20287qLPjoWVMSIciFJn1Ei3R4ZoVKbU9TECP56TSAAqx1pDlh5mjpqsyfhEqugvVtNqVw+0Lr3otJh88q53n1NMeYafhyImT1Kx5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740184453; c=relaxed/simple;
	bh=VBQHljTSYFVCaj1bbqPfTOtZckZuFzfefk82naOnO1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgB9Aa4MFSsxZeqNhYj0iBUIDZhM2RzE1ofgaLq4R6oTi0LjKXv+lbz2sKffcyVEGuqNNKy5YrvworrcjBuiPfmeZZ6VmLeXaVtBt2y9pQ41xw0sCDQQwPDtx2fN2D1/tLjHXekd3WIb7PVwupz5Ba2Fq4bJTr47/QIE1qkcplE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XdiwAy00; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XdiwAy00"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f6ca9a3425so23550697b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Feb 2025 16:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1740184450; x=1740789250; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwm1CmURc5ve7fRU7CIVjr3XJe8XTIamKjt5b8I2oxA=;
        b=XdiwAy00ajxoIfm+F1RfTmJFIX7q9iKUnZXKi2Rkp999z/67df9ycuFNbNcioJcc0U
         XWI1R3u9eCV2WY3wgPEso4RFCaXuknR7KU3ygKuxEPoUJNT2qCqexQbiqlLKuSDF4nKr
         UDR8fv7L2gV97bn/CYTIks8FnB2BFwXFvn5EZKOTvry18RVKnjcHAe26mfvO+dZhWvwc
         Wbfu0PZUP58vDD/l3AHbJbU/YlSS8O7HYvLFaBrKGYMg5pTWjyBS5DCDeOeLHlwzSmVg
         fu/749+hFb0FPHDA5WQJBfXrjwgdJikNKdhDOo82gbBzp7KubcOCUoqIX6xssg8JO4WT
         uglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184450; x=1740789250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwm1CmURc5ve7fRU7CIVjr3XJe8XTIamKjt5b8I2oxA=;
        b=ZvF0OvFdawHpIy27DDXxoveMUNlzSPac8L/hz0yJTOYAia8xf1t2pFcr/Av5v0zXNp
         UNrK2sE1kAzdW/BCmT/QHSyMusaqbjulx9o+CAOdN/bOu5U2mtKw6OBxjQPIYtlSVefZ
         amaRCRDku9gQfIKW36uhZLCGyDB3DTNPThgzBsYS7WVvU1aECzrXHWLgFiTVCn6Yrdze
         4ebSGY4DANr0JzWrXvJz1+kLpqMKyeyEHFOn5KKGhbh0Mcb68sHbRY8tniIENKAjN5OE
         BCFGjfZ4o7Tyz2ScCsPhzPVvtuYI5k8fXbAurXioKp2oLUrHipNX5Per+lH+BwYOtmCb
         vqcA==
X-Forwarded-Encrypted: i=1; AJvYcCWMgzLp84uQFMjUy3q2t2AE17RUeCdZkisrm79CtJDmD6nFSmNxEdh7+LU6S29i08gO3K6zBhAVjBuM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz8v00EO5zBQ5e1zzRlGHyG02iYiph+QWlrPmOCJ58kBxesN6y9
	9UKSX/TWaUOolyvHmQATJxVw9qBNvZIVtOuuhEfYgUazMgTeefHEQer+6Zy56L1GQf3pjEkOSmL
	4g8Evoycxt3/f3vph7zIKpbD6NSXnQ4XU3tMo
X-Gm-Gg: ASbGncuM9RY0J1NacyDC+u1lsXfDBrmKK+1c+xYOWaHNAynCRshymrJABkGuSS5vYPn
	syBbDPp7FRioaGk4Ba1f7ZNRFQrHIoPs0zc1GFVPoTZ8ZPmOQHK45Ezv9b0meG7UBS55Qp62+ZG
	0dojZfb7Q=
X-Google-Smtp-Source: AGHT+IHU8mqrXQveakYlLhZ7AQnDt8Huldya+naR0jPDiYuZo2FksnUyR3yBLKwefOB052PduAKRpiO/vKqO0ObiYCs=
X-Received: by 2002:a05:690c:3506:b0:6f6:c937:2cf4 with SMTP id
 00721157ae682-6fbcc81835dmr37934927b3.23.1740184450404; Fri, 21 Feb 2025
 16:34:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org> <20250221.ahB8jei2Chie@digikod.net>
In-Reply-To: <20250221.ahB8jei2Chie@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Feb 2025 19:33:59 -0500
X-Gm-Features: AWEUYZkJvdf7eQZPTJrwhKnqZP-Y8wnVSUpipQ3Me6WvrrB1wQej040Y9lsHrww
Message-ID: <CAHC9VhSnP=j_T30ctVmzQ8TwhD6YFcrWhLbqa_oG3WSAPUPOaA@mail.gmail.com>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 10:08=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digi=
kod.net> wrote:
>
> It looks security checks are missing.  With IOCTL commands, file
> permissions are checked at open time, but with these syscalls the path
> is only resolved but no specific access seems to be checked (except
> inode_owner_or_capable via vfs_fileattr_set).

Thanks for reviewing the patch and catching this Micka=C3=ABl.  I agree
with the hooks identified and their placement; it should be fairly
straightforward with only a few lines added in each case.

--=20
paul-moore.com
