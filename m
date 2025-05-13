Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44028C5B5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 May 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140812; cv=none; b=OAFn8JCtwBfo9K1C58KGo+03R1MOkTTveGSfR4TU9IbinPWtty4zOEdZvoEvwF3eLCU8ygoesfECgwtv3Fzm+b65TZoLkwU0xGydg6VEOBXDEGwyvwvTyzyAYj/4s1SPVUEqrPJGsboy5k/76vASSWS775H0/Amq5CizvOMatjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140812; c=relaxed/simple;
	bh=i14x7HK+wQByi+0aKyFzNcOhWac1lJuJhW5b260ntpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mumr5vF6jDD3Fy3Rp/6CfoRgl8B1iSwKyXB3b4kQ4TGyamHE7o9ukTPd6qj9zchptF83NIx2hW4cJkRbXwSp5MyPLshngHBysqThad7VV49/jdhnRpDrLvuKuTFzBPKAI4W7pfxFLdocyu9EtPuRb8JAgeFsMPEARRuXbLDT73Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNtJ04lv; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNtJ04lv"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fbed53b421so8789225a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 May 2025 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747140809; x=1747745609; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhUsGW6Aej7UtwPk8Fo3WswAje2EzwjwJ+3T+imRPIA=;
        b=YNtJ04lvLYwEnO5IdrLbrvzWLA6pbOVDHeq+7OL686m+ZYb9KvlvFpOOtMRg0WfK/C
         Of+JUbr+t9XQ91PGfGeo6rx2V10moJN4mO3/P6NudmKSAkIkUkJ2BAewI4UWzDWneYEx
         vL6XyF8y2mp/FOfmlvOWlUX7xR8fFxx+/ryM0vI0jDc3fFfR/Wwpc/DF1LUl9D6Uyo6O
         fXvAabSnoM5bCS+fgyovO/oq2bTnhUFD/dNHGqyEnMqi4O04DNaXI4S1MYXqx1lxOfNU
         aAjMMdPR431aMiIl0m2eVaHgkthJU4L0U8Ep+WWLnmI0jJ06igSdfxGfUHq/JQnOWdOp
         D6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140809; x=1747745609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhUsGW6Aej7UtwPk8Fo3WswAje2EzwjwJ+3T+imRPIA=;
        b=Y2JqGZnxNdMefHHBcZdM3+9GxW5UrN2WfVgs8EcZgXOb0BUG4yi3fURw3NMQrPsxPL
         /m891rj05FTxb+H1XSR0ZOwuLJgGRCi//NYk2WaOVwwKKvDbFinKuFxlQaCBj/FupSxI
         vVXut7vSwcsGM2EFSiozR2o86zOZ9baVgrFK3gbbC5XLARZQAZpGaeWpBK9FTXkq7aoh
         QhZCD+3HzqfP1SFiapMhZpr2MyCQm+ErJ1yQB5NM6PNyUjx8IPb0TTkgzW/4pJ/nHoI5
         JwydvgKiFGGT3pXeIZpvMdpOIBa52FjsGeXS4COSN0m3sDmgMbrSvJAGV0kDVftAtZ4L
         KeDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUre+6QdF6P/WhxC9CCSUZdjnookVpk00DV+mzM71z10GvFQ/yHSnAyDxqT1weCUE0Lr8GjkpUdial8@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzRrKWn5d3r1EHsmAzPP/VnKV6iT0CGtMZUcAvrkDNwxDt8r2uh
	QQGp3aUgJzuVSMvremo+CDOSJjsf4dKv+079sVcOkxAHObkaBQV57TCDDrslYKNOiZrh9YZVkgq
	mi7W2LuZMmJa8Sqgpudk5DdoSFh4=
X-Gm-Gg: ASbGncukTRJ4Ju3tR1HV4duqtJWVpi4oPXWwHeW8A/HJ+KorwnscTb/JlNZnhgXbWoB
	ZW1ljYHE5p9hGXvKdWWlfautulY75tmZn4U0duy2rtavU68xMAEs2s7MvpQR/8VqQX8dRwSqHis
	YUUm1J+7sIPOXL+YB7W07CsY3dJhT/tm34
X-Google-Smtp-Source: AGHT+IE/b0BCD4zsWzgMefEsXbY+DbhCAD/XOG3dRDcg9jP4PpucFQp1j7NsiRF8Za5+3lLoqjezqR5fGVfm35+9pG4=
X-Received: by 2002:a17:907:7617:b0:ad2:23fb:5a03 with SMTP id
 a640c23a62f3a-ad223fb7c87mr1075619066b.7.1747140808774; Tue, 13 May 2025
 05:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org> <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
In-Reply-To: <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 13 May 2025 14:53:17 +0200
X-Gm-Features: AX0GCFu24ZFGPch6zxlVZkmp4exgi2YQWGGbqSjGo76MZv2IKCv94Wv0HRsT2OA
Message-ID: <CAOQ4uxgOAxg7N1OUJfb1KMp7oWOfN=KV9Lzz6ZrX0=XRGOQrEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
To: Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org, 
	ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 11:53=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
>
> >
> >       long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> >               struct fsxattr *fsx, size_t size, unsigned int at_flags);
> >       long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> >               struct fsxattr *fsx, size_t size, unsigned int at_flags);
>
> I don't think we can have both the "struct fsxattr" from the uapi
> headers, and a variable size as an additional argument. I would
> still prefer not having the extensible structure at all and just
> use fsxattr, but if you want to make it extensible in this way,
> it should use a different structure (name). Otherwise adding
> fields after fsx_pad[] would break the ioctl interface.
>

Are you are suggesting that we need to define this variant?:

--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -148,6 +148,17 @@ struct fsxattr {
        unsigned char   fsx_pad[8];
 };

+/*
+ * Variable size structure for file_[sg]et_attr().
+ */
+struct fsx_fileattr {
+       __u32           fsx_xflags;     /* xflags field value (get/set) */
+       __u32           fsx_extsize;    /* extsize field value (get/set)*/
+       __u32           fsx_nextents;   /* nextents field value (get)   */
+       __u32           fsx_projid;     /* project identifier (get/set) */
+       __u32           fsx_cowextsize; /* CoW extsize field value (get/set=
)*/
+};
+

> I also find the bit confusing where the argument contains both
> "ignored but assumed zero" flags, and "required to be zero"
> flags depending on whether it's in the fsx_pad[] field or
> after it. This would be fine if it was better documented.
>

I think that is an oversight.
The syscall should have required that fsx_pad is zero,
same as patch 6/7 requires that unknown xflags are zero.

If we change to:
       error =3D copy_struct_from_user(&fsx, sizeof(struct
fsx_fileattr), ufsx, usize);

It will take care of requiring zero fsx_pad even if user calls the syscall =
with
sizeof(struct fsxattr).

Thanks,
Amir.
