Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E1238173
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 May 2025 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820206; cv=none; b=jRBHGVSdkjTVyv2hCbzzT+0bdS9HCQ6qCPcdUj0wMfuAxQm0R4ENg8PqzXRDLvMG6qwEMicY2I/4qIgb1CZN+iRB0K0HogDcB5NKnymOWR0EYRuacauThLwp9h9VnSHVINp51WxR4bRPtJqUlGWYhva0/wzw3Kj6fBpTGV3R9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820206; c=relaxed/simple;
	bh=e9mhTzPo8UBltwt4IxdWmpzOcMesj+ao1kr0nV4Kb2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsKDJmn7Q1KjftyEr/eSpejXopvTi9ExEaSlj7F15KMG/5FCRkS7oOlLqHMvPFqxJ5v6P7IVHGBilnv77YumagReWVE0D08w3GBwud7xwLJpkaPOhYsLqYgl+z37XVV1/wL0MPZOIvDibwmVnwlce3OQs0fgJd3z9rmt04WTc2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGOQmJUT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGOQmJUT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad216a5a59cso925420766b.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 May 2025 02:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747820203; x=1748425003; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fDT/rPyS09cFNKeRhfGuyH5tO25pffu2I+mqbu+oKo=;
        b=HGOQmJUTvRuHvTaphO48UZiP3fKMZUh391oPO59tuu05hA20BD79hqndvgWPLtcroa
         JnyCqUcqMkbHPXC0/W1q5SS8uI1rDdMHujYAwsXX9wVLpu0fqZzm0R+0ngHLxFO6e8vg
         7hW4usPBsxEtHOE1Kz/iMiUT3SjM6IDVhcTq5nMYbRKP6zDBrkEVeFNN7CNUJka6clbQ
         C3OqZ7pMbmj73+ngevA/OjWZnQ0vjvlHYrYl6Sf16/jWTGOBmbRGaC9tjb9J009YBSSo
         MHRh30Z6S0KAzBdZO3u37OBJ7qYIjqfOg7icGlfSaFKa635pXdJdi7jqVGZKFtQxTrJr
         Jvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747820203; x=1748425003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fDT/rPyS09cFNKeRhfGuyH5tO25pffu2I+mqbu+oKo=;
        b=awLAdqTN8vITHmbDH/TGyd7DOLNMk3KqEoQiKdsYJR4f2a7Oj75FB14H3F1u1jjm1P
         IdACgG7QIhelHJkvfGwzMKIvBNgsUNOCNG5oXgTBJQ96feupWaGrmgheKX6w8HrwU1Fp
         Jq6iZQ5iihS+i2YEl1X07RsHascPAK0MPsXpeWUAA0HWJ8PRlcScSowywB/rrv6YrWgR
         9JBiwRHujMTLAuY+liQJj76SRQvvLr2Za4MYtpvSB+yjyIoOxun/TSwqOZoIWhvUhQHe
         rP9IzHkzJWZ57TV8ayUtPXr7Ku1Gjafx3/RctOrm5AQMeL3yUBVd+dO5JbIFTjmkYChP
         QXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvmJjDbGdSZKzPlzV/D1vsbQ1HLGQeSW0IcBk1EWilyq9RxwJpBf8etaoELD7HbD95gSvX3hxpjW/Q@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyl0DJvwrbglrDzlm9CWFoUUD+tSZH5spTHlOE8TebOYn/evVcS
	kMmGmJHNJuv4rm/AKZbD5M4JDbZMtaXN9lRkDuGihBJ2Kv8GzMiXP6aycNTQQnk3Mzj65D3Ht80
	rEribkzmw7P5d13YAjbAvRrj7L7JSsxM=
X-Gm-Gg: ASbGncu97xbI8RntkPoEkM5uniF1nKxfHsetJ5ugvvMl95t5XnVa20q1SBsV6UHRy/T
	lo1YXpO/vUyF1f20GJG1CUTlcLzl5ag+iNS7KGfUPJFl3p5Vt+MW1J0of06LukAgWPFAL2qkICj
	eXRpT82OChOOCrawkdd6A+7c6WnY6FWsvf
X-Google-Smtp-Source: AGHT+IFRnJEcWleyx7qwRg7vCSphUUiTic92QQTbjBIO27j1RZLPz4oc9+NYTvPTi3d4hgYaU1hHw6EOra2vJZB7M9Q=
X-Received: by 2002:a17:906:2b1b:b0:ad5:3746:591b with SMTP id
 a640c23a62f3a-ad537465cf1mr1369436966b.55.1747820202406; Wed, 21 May 2025
 02:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com> <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
 <aCsX4LTpAnGfFjHg@dread.disaster.area> <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
In-Reply-To: <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 May 2025 11:36:31 +0200
X-Gm-Features: AX0GCFvWQ5JZ1WJhnjsofvtr8p7StwkfQswgOpTGVD-EYd-NOKxs-pNdKNcJ-sU
Message-ID: <CAOQ4uxiM+BBNODHfxu=v3XN2ezA-0k54qC5R4qdELbZW+W-xkg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Dave Chinner <david@fromorbit.com>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
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

On Wed, May 21, 2025 at 10:48=E2=80=AFAM Andrey Albershteyn <aalbersh@redha=
t.com> wrote:
>
> On 2025-05-19 21:37:04, Dave Chinner wrote:
> > On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> > > On Thu, May 15, 2025 at 11:02=E2=80=AFAM Christian Brauner <brauner@k=
ernel.org> wrote:
> > > >
> > > > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > > > >
> > > > > >
> > > > > >     long syscall(SYS_file_getattr, int dirfd, const char *pathn=
ame,
> > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_f=
lags);
> > > > > >     long syscall(SYS_file_setattr, int dirfd, const char *pathn=
ame,
> > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_f=
lags);
> > > > >
> > > > > I don't think we can have both the "struct fsxattr" from the uapi
> > > > > headers, and a variable size as an additional argument. I would
> > > > > still prefer not having the extensible structure at all and just
> > > >
> > > > We're not going to add new interfaces that are fixed size unless fo=
r the
> > > > very basic cases. I don't care if we're doing that somewhere else i=
n the
> > > > kernel but we're not doing that for vfs apis.
> > > >
> > > > > use fsxattr, but if you want to make it extensible in this way,
> > > > > it should use a different structure (name). Otherwise adding
> > > > > fields after fsx_pad[] would break the ioctl interface.
> > > >
> > > > Would that really be a problem? Just along the syscall simply add
> > > > something like:
> > > >
> > > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > > index c91fd2b46a77..d3943805c4be 100644
> > > > --- a/fs/ioctl.c
> > > > +++ b/fs/ioctl.c
> > > > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, uns=
igned int fd,
> > > >         case FS_IOC_SETFLAGS:
> > > >                 return ioctl_setflags(filp, argp);
> > > >
> > > > -       case FS_IOC_FSGETXATTR:
> > > > -               return ioctl_fsgetxattr(filp, argp);
> > > > -
> > > > -       case FS_IOC_FSSETXATTR:
> > > > -               return ioctl_fssetxattr(filp, argp);
> > > > -
> > > >         case FS_IOC_GETFSUUID:
> > > >                 return ioctl_getfsuuid(filp, argp);
> > > >
> > > > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, uns=
igned int fd,
> > > >                 break;
> > > >         }
> > > >
> > > > +       switch (_IOC_NR(cmd)) {
> > > > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FS_I=
OC_FSGETXATTR)))
> > > > +                       return SOMETHING_SOMETHING;
> > > > +               /* Only handle original size. */
> > > > +               return ioctl_fsgetxattr(filp, argp);
> > > > +
> > > > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FFS_=
IOC_FSSETXATTR)))
> > > > +                       return SOMETHING_SOMETHING;
> > > > +               /* Only handle original size. */
> > > > +               return ioctl_fssetxattr(filp, argp);
> > > > +       }
> > > > +
> > >
> > > I think what Arnd means is that we will not be able to change struct
> > > sfxattr in uapi
> > > going forward, because we are not going to deprecate the ioctls and
> >
> > There's no need to deprecate anything to rev an ioctl API.  We have
> > had to solve this "changing struct size" problem previously in XFS
> > ioctls. See XFS_IOC_FSGEOMETRY and the older XFS_IOC_FSGEOMETRY_V4
> > and XFS_IOC_FSGEOMETRY_V1 versions of the API/ABI.
> >
> > If we need to increase the structure size, we can rename the existing
> > ioctl and struct to fix the version in the API, then use the
> > original name for the new ioctl and structure definition.
> >
> > The only thing we have to make sure of is that the old and new
> > structures have exactly the same overlapping structure. i.e.
> > extension must always be done by appending new varibles, they can't
> > be put in the middle of the structure.
> >
> > This way applications being rebuild will pick up the new definition
> > automatically when the system asserts that it is suppored, whilst
> > existing binaries will always still be supported by the kernel.
> >
> > If the application wants/needs to support all possible kernels, then
> > if XFS_IOC_FSGEOMETRY is not supported, call XFS_IOC_FSGEOMETRY_V4,
> > and if that fails (only on really old irix!) or you only need
> > something in that original subset, call XFS_IOC_FSGEOMETRY_V1 which
> > will always succeed....
> >
> > > Should we will need to depart from this struct definition and we migh=
t
> > > as well do it for the initial release of the syscall rather than late=
r on, e.g.:
> > >
> > > --- a/include/uapi/linux/fs.h
> > > +++ b/include/uapi/linux/fs.h
> > > @@ -148,6 +148,17 @@ struct fsxattr {
> > >         unsigned char   fsx_pad[8];
> > >  };
> > >
> > > +/*
> > > + * Variable size structure for file_[sg]et_attr().
> > > + */
> > > +struct fsx_fileattr {
> > > +       __u32           fsx_xflags;     /* xflags field value (get/se=
t) */
> > > +       __u32           fsx_extsize;    /* extsize field value (get/s=
et)*/
> > > +       __u32           fsx_nextents;   /* nextents field value (get)=
   */
> > > +       __u32           fsx_projid;     /* project identifier (get/se=
t) */
> > > +       __u32           fsx_cowextsize; /* CoW extsize field value (g=
et/set)*/
> > > +};
> > > +
> > > +#define FSXATTR_SIZE_VER0 20
> > > +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
> >
> > If all the structures overlap the same, all that is needed in the
> > code is to define the structure size that should be copied in and
> > parsed. i.e:
> >
> >       case FSXATTR..._V1:
> >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1));
> >       case FSXATTR..._V2:
> >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2));
> >       case FSXATTR...:
> >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr));
> >
> > -Dave.
> > --
> > Dave Chinner
> > david@fromorbit.com
> >
>
> So, looks like there's at least two solutions to this concern.
> Considering also that we have a bit of space in fsxattr,
> 'fsx_pad[8]', I think it's fine to stick with the current fsxattr
> for now.

Not sure which two solutions you are referring to.

I proposed fsx_fileattr as what I think is the path of least resistance.
There are opinions that we may be able to avoid defining
this struct, but I don't think there was any objection to adding it.

So unless I am missing an objection that I did not understand
define it and get over this hurdle?

Thanks,
Amir.
