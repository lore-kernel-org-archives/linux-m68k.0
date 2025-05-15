Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BC02980DC
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 May 2025 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305228; cv=none; b=HYWjDmhzEjCQLcgAyDeIQ6K7cOyWoEPPjbFRugPpV6t93Ua/M9ZlNF6BfNkyQzPvXeyjGQob2yTMw386we8iHBZQbS01Zm6MgPqO/9akJ3LP2Sq4EciVXAKFM3q+Ky5QD0kLq0taXgb7YIUdhzjhyrSUeaukZqft2gUmHWjrCzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305228; c=relaxed/simple;
	bh=0Ca4GoXXMXx6cHQk8bHNd0lNmpQHYfAdXnzIxwgHL3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzDmol4mRCbtXwZcFramlhE5R7npOf98rDvyqHrI/PRIsypXnrMjMY1prYLkIc0Wr767MIA2jdGuYOlTaJ/yuEhm8s29lhV7/P6tn6sN9Pf53H+9Ayf32re8l4bGOWdTbg7CJbkDnQkG6htJJAJaed4/8C5wNV30L3IxmoaVoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fv5N2fRi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fv5N2fRi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad23c20f977so106335266b.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 May 2025 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747305224; x=1747910024; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ix0mN7yylNXsLKVIXpa3RC7XyXUMorhAJgZhoj08KZI=;
        b=fv5N2fRirneWAvU7TPjWCcEpilTo3IpslZjn+T8Mzy3x8MUIL0YMK7VN2Y3Pb7J5pz
         Um9PrTRjiOqtiPWbn2QujtJDivUF8QE2nxxP7R1c9yUnNhS1rru7lrUbkbIY3TMW24EH
         EmFAap5a35NeAQwxV1qnyNkN7ERP/RU2nLXywtUmL3IDgr40icWHqcxI4si/FS7ldZYq
         ijiDVy4HXd1f+eM8hEhTLRcjrEjC6j2SmJ6xsZYQelHjZ6Abex2HdS+4W2PIiC7R+JBd
         GMNEfQ/HFd6/xkP9eBJISPBJ4UbLbTIMiq4cSYArdc5eQItJBBdek7VL2HkRg7BqIauZ
         +a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747305224; x=1747910024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ix0mN7yylNXsLKVIXpa3RC7XyXUMorhAJgZhoj08KZI=;
        b=Fo2bSQZPY4T7NNgggjduZb9qF/V9G3Hohh5Nleknik12nsXuzBJoGTt30yiJWFR1le
         rlAkDCG8HoIEfs8n95wCn1/KOglBA2OKqlN0d6FBEnIS4wDHoQR2SqzEto1mxg+VTyfc
         MxWOOJFjzL5sS/tYKAEZ0ZIhL0TFxCeG8j3020q+Q46VKN93Raz3a3fFV6KmEk3rHaQl
         pDFkSIvla50a2sK1FMJgkCaEHLBKiHV0LwZyuFTq++SN/+2CamsZyt5a26VB92ciGdVT
         DqAZcXM3bHbHeRekFTXUlD2isVeWZOQzbFj1ynAvf7QU1+1daAVDUmhAtPCtyXL/FtZd
         OlNg==
X-Forwarded-Encrypted: i=1; AJvYcCVJEKd53jGUlpIGBK+n8X45wt8WNgOgFTPziBjF4LLJC4tT+sLxpOyYQSWp/Q0TCWe6wDMBzArGtdk3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy9ZEO6tmph7nJ6JjyW7dgzUSqyqYDao9VPK9NQcLHqEs64hTew
	KD0RsiRjmO16VExvAPSJ77sDN/YEqvAWwusLNMZGrSWzx1YtNBP8Yh+rfZCZ5ngwYdt1rENjdRl
	BL2ZTS+dKZh9CmqoLsAIRua/JfhI=
X-Gm-Gg: ASbGncsjIq5HgpQ1jHlzSC86MyUX6wPhp5EsQ2ZPlhclAx9deaUswtpsNmjDNYHjnDO
	UMDqLXvOn5Dcjz9UMGg/kDZ3cIqvo7VI2DF4ozpWCNQoolPfoXyPYyxpecwbgkt4he1ncaN7NhQ
	TZ/beHDCscZ+2jvuW/WZotAtnEgBxDa2jw
X-Google-Smtp-Source: AGHT+IH/YFjWiUa7Oe6APhoaMiAXM+TxOKXzzX9IOWrtv4bcH+n6gSWZSohhovEJvJss7Wr0el1TN6Dn7PUuhUUlRKw=
X-Received: by 2002:a17:907:72c1:b0:ad2:e683:a76c with SMTP id
 a640c23a62f3a-ad515d79f17mr198604066b.7.1747305223832; Thu, 15 May 2025
 03:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com> <20250515-bedarf-absagen-464773be3e72@brauner>
In-Reply-To: <20250515-bedarf-absagen-464773be3e72@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 May 2025 12:33:31 +0200
X-Gm-Features: AX0GCFv6VzJTt0PbxjVfcfLF_B5PjKPMcuhdvqJqoMNLfQeCg9Kk1MZMyM5NBko
Message-ID: <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
To: Christian Brauner <brauner@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrey Albershteyn <aalbersh@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
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

On Thu, May 15, 2025 at 11:02=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
>
> On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> >
> > >
> > >     long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > >     long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> >
> > I don't think we can have both the "struct fsxattr" from the uapi
> > headers, and a variable size as an additional argument. I would
> > still prefer not having the extensible structure at all and just
>
> We're not going to add new interfaces that are fixed size unless for the
> very basic cases. I don't care if we're doing that somewhere else in the
> kernel but we're not doing that for vfs apis.
>
> > use fsxattr, but if you want to make it extensible in this way,
> > it should use a different structure (name). Otherwise adding
> > fields after fsx_pad[] would break the ioctl interface.
>
> Would that really be a problem? Just along the syscall simply add
> something like:
>
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index c91fd2b46a77..d3943805c4be 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned =
int fd,
>         case FS_IOC_SETFLAGS:
>                 return ioctl_setflags(filp, argp);
>
> -       case FS_IOC_FSGETXATTR:
> -               return ioctl_fsgetxattr(filp, argp);
> -
> -       case FS_IOC_FSSETXATTR:
> -               return ioctl_fssetxattr(filp, argp);
> -
>         case FS_IOC_GETFSUUID:
>                 return ioctl_getfsuuid(filp, argp);
>
> @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned =
int fd,
>                 break;
>         }
>
> +       switch (_IOC_NR(cmd)) {
> +       case _IOC_NR(FS_IOC_FSGETXATTR):
> +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FS_IOC_FSG=
ETXATTR)))
> +                       return SOMETHING_SOMETHING;
> +               /* Only handle original size. */
> +               return ioctl_fsgetxattr(filp, argp);
> +
> +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FFS_IOC_FS=
SETXATTR)))
> +                       return SOMETHING_SOMETHING;
> +               /* Only handle original size. */
> +               return ioctl_fssetxattr(filp, argp);
> +       }
> +

I think what Arnd means is that we will not be able to change struct
sfxattr in uapi
going forward, because we are not going to deprecate the ioctls and
certainly not
the XFS specific ioctl XFS_IOC_FSGETXATTRA.

This struct is part of XFS uapi:
https://man7.org/linux/man-pages/man2/ioctl_xfs_fsgetxattr.2.html

Should we will need to depart from this struct definition and we might
as well do it for the initial release of the syscall rather than later on, =
e.g.:

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
+#define FSXATTR_SIZE_VER0 20
+#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
+

Right?

Thanks,
Amir.
