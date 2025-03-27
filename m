Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C931FF7C5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Mar 2025 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075584; cv=none; b=juCkhN6x+OCPe9Kj0L59CaI58FD9eWXOygS9+TVmYfU4VJCR4jedRmjCxvgp05dZqat0n0psk27pl5pnnR+qYdkhcMZ4DOmvW+XSEFQOfU98ejPLPds4puGFyFVr8EIfskUIfhuLre5juoN3NwwaKgrjvGBbHrSX1acmSX5cM1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075584; c=relaxed/simple;
	bh=HLTBY8S4ZTpJUpA3lXf5BDLlXk9fvudGXjyPq/LNYbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EboAFcSnw3GsVBC5UpkADpFWYBO1bS7dfCtDx9JgEv39J0T0QWEAC5Ju3bkrpD9VlVsUS8HMsl76+XPB4PYUo8HnGC/um6fV2uGaKQTm+ve22oBs+6yMdCiKehSipVhBFJ+VZ8W+mXf93TGgeVbai2f4Lk9ebf1MQ8O/aM3KhPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmQ4Pfd5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmQ4Pfd5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1546054a12.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Mar 2025 04:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743075581; x=1743680381; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5YJ+HIPr7Xtl+bdBaUXFEAtySXgJKTavR2pWedTVNo=;
        b=XmQ4Pfd5naxI4hgZ2049AM6TF/KqLq+bst0upZkp1wbQhIPwkwK7h6NDbnC0UCZQrS
         HAdxE+H0cB0XtyRhTnJ9mClq0n8WKYaNBiWw7yAzl1U7djQldx+yvDDocrUR2+JU5wD5
         JQa0tznFoXCbW4kewjCC4dh3WN0Vdr+BW0hcA/1I2AHORtMBp2Uqtq8g/wELcd/HDVZy
         kWZTvCTP6WdmfU5u/3ftU2p6IMHaiyuob7jrTfvFA6p547Zy900gvpxQkF8hR+hd1RA1
         jBT7vgT+PMzN7cPy07GKjYReYpzdhLkUCMRBv8SDm+oEFcmKGYX/4cExTslXBfM9IeHo
         8D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075581; x=1743680381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5YJ+HIPr7Xtl+bdBaUXFEAtySXgJKTavR2pWedTVNo=;
        b=g9kJjV2cnA9t6ktUHzxKWKW2L0CjY4EIVWqVH1ZQUzdRcl3w7Ui53as7X37vGioy1k
         mMI5K68ZWphJgHLn3zYA1A3737wtfG0F3lJ9tx3j8yrPkMH/mH+eRwTu/VYY6OZfiTQH
         mq/sUpxlvSXqe4KSgMv3I22V0lsARZ5YjyCCf+ipSjCkdAF+xL7ty20baZAW4MIedhmd
         +ekj2T/KE/WcI+5xcvZzyTi/S+V/Gi7slfIK8EzeYnV85ITLSI1KCt/yKCY6+MAMDgai
         Bw07YP1K+8IpZ+9dKR9JURaQbApEZt3sPCtBJttOc+E4yqwIofmAk6nUheBLtln93uPX
         WvNw==
X-Forwarded-Encrypted: i=1; AJvYcCUMPfXT6+lEPL6PIQS3JlKYK6j1TiqHZntcY8hafukZtfiAa3e8z46NHVGctaEYdXImLpC2cCN2oOfP@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwQ827CqE/vJpTRhvZkgI2BKg2weybAHc+FfJnx/c3JOo7LfMJS
	1g3E7ynbAEXCeWUakgFaMrchgE1f5UrcTg1tvlvU6Ks+zuZrDVS1jxdwVQoFIIhmBt/HFS/IO2Z
	NOpNcQaMdhU5eRZZQ7KXRTE6LR/U=
X-Gm-Gg: ASbGncvjvSMcw6pfkjlianKmoFgLZUkH5wqzz44KYArqD8426y0LqWSNcXGlrWt9c4b
	jJrAdsgD4RcytkvVfo4SgItx81AaCCo0cchWT9QZtRQHEUlQvKaYW9Z6UBbIsK+56OlNFrYhB13
	s3ltR0dGPASrvBzran1uVDrLvgYg==
X-Google-Smtp-Source: AGHT+IGgy/miY5V7+MPkH09VPO41DMi/jMR8Bk4E49dQyif98hlWpMqsre9jbg/TLCs8zzkfhNjlalqvBIB5xRYILRM=
X-Received: by 2002:a05:6402:518d:b0:5e7:b02b:6430 with SMTP id
 4fb4d7f45d1cf-5ed8f3fd122mr2772445a12.23.1743075580404; Thu, 27 Mar 2025
 04:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org> <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
 <faqun3wrpvwrhwukql3niqvvauy5ngrpytx5bxbrv5xkounez3@m7j2znjuzapu>
In-Reply-To: <faqun3wrpvwrhwukql3niqvvauy5ngrpytx5bxbrv5xkounez3@m7j2znjuzapu>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 27 Mar 2025 12:39:28 +0100
X-Gm-Features: AQ5f1JofzJgaxJ0LZuoFvXDiOPJAJ8w60JwbZ8r4It-kQ_jhprqRZDypv8Lufbk
Message-ID: <CAOQ4uxjs=Gg-ocwx_fkzc0gxQ_dHx-P9EAgz5ZwbdbrxV0T_EA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>
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
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 10:33=E2=80=AFAM Andrey Albershteyn <aalbersh@redha=
t.com> wrote:
>
> On 2025-03-23 09:56:25, Amir Goldstein wrote:
> > On Fri, Mar 21, 2025 at 8:49=E2=80=AFPM Andrey Albershteyn <aalbersh@re=
dhat.com> wrote:
> > >
> > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > >
> > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > extended attributes/flags. The syscalls take parent directory fd and
> > > path to the child together with struct fsxattr.
> > >
> > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > that file don't need to be open as we can reference it with a path
> > > instead of fd. By having this we can manipulated inode extended
> > > attributes not only on regular files but also on special ones. This
> > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > we can not call ioctl() directly on the filesystem inode using fd.
> > >
> > > This patch adds two new syscalls which allows userspace to get/set
> > > extended inode attributes on special files by using parent directory
> > > and a path - *at() like syscall.
> > >
> > > CC: linux-api@vger.kernel.org
> > > CC: linux-fsdevel@vger.kernel.org
> > > CC: linux-xfs@vger.kernel.org
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > ...
> > > +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filenam=
e,
> > > +               struct fsxattr __user *, ufsx, size_t, usize,
> > > +               unsigned int, at_flags)
> > > +{
> > > +       struct fileattr fa;
> > > +       struct path filepath;
> > > +       int error;
> > > +       unsigned int lookup_flags =3D 0;
> > > +       struct filename *name;
> > > +       struct mnt_idmap *idmap;.
> >
> > > +       struct dentry *dentry;
> > > +       struct vfsmount *mnt;
> > > +       struct fsxattr fsx =3D {};
> > > +
> > > +       BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> > > +       BUILD_BUG_ON(sizeof(struct fsxattr) !=3D FSXATTR_SIZE_LATEST)=
;
> > > +
> > > +       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) !=3D =
0)
> > > +               return -EINVAL;
> > > +
> > > +       if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> > > +               lookup_flags |=3D LOOKUP_FOLLOW;
> > > +
> > > +       if (at_flags & AT_EMPTY_PATH)
> > > +               lookup_flags |=3D LOOKUP_EMPTY;
> > > +
> > > +       if (usize > PAGE_SIZE)
> > > +               return -E2BIG;
> > > +
> > > +       if (usize < FSXATTR_SIZE_VER0)
> > > +               return -EINVAL;
> > > +
> > > +       error =3D copy_struct_from_user(&fsx, sizeof(struct fsxattr),=
 ufsx, usize);
> > > +       if (error)
> > > +               return error;
> > > +
> > > +       fsxattr_to_fileattr(&fsx, &fa);
> > > +
> > > +       name =3D getname_maybe_null(filename, at_flags);
> > > +       if (!name) {
> > > +               CLASS(fd, f)(dfd);
> > > +
> > > +               if (fd_empty(f))
> > > +                       return -EBADF;
> > > +
> > > +               idmap =3D file_mnt_idmap(fd_file(f));
> > > +               dentry =3D file_dentry(fd_file(f));
> > > +               mnt =3D fd_file(f)->f_path.mnt;
> > > +       } else {
> > > +               error =3D filename_lookup(dfd, name, lookup_flags, &f=
ilepath,
> > > +                                       NULL);
> > > +               if (error)
> > > +                       return error;
> > > +
> > > +               idmap =3D mnt_idmap(filepath.mnt);
> > > +               dentry =3D filepath.dentry;
> > > +               mnt =3D filepath.mnt;
> > > +       }
> > > +
> > > +       error =3D mnt_want_write(mnt);
> > > +       if (!error) {
> > > +               error =3D vfs_fileattr_set(idmap, dentry, &fa);
> > > +               if (error =3D=3D -ENOIOCTLCMD)
> > > +                       error =3D -EOPNOTSUPP;
> >
> > This is awkward.
> > vfs_fileattr_set() should return -EOPNOTSUPP.
> > ioctl_setflags() could maybe convert it to -ENOIOCTLCMD,
> > but looking at similar cases ioctl_fiemap(), ioctl_fsfreeze() the
> > ioctl returns -EOPNOTSUPP.
> >
> > I don't think it is necessarily a bad idea to start returning
> >  -EOPNOTSUPP instead of -ENOIOCTLCMD for the ioctl
> > because that really reflects the fact that the ioctl is now implemented
> > in vfs and not in the specific fs.
> >
> > and I think it would not be a bad idea at all to make that change
> > together with the merge of the syscalls as a sort of hint to userspace
> > that uses the ioctl, that the sycalls API exists.
> >
> > Thanks,
> > Amir.
> >
>
> Hmm, not sure what you're suggesting here. I see it as:
> - get/setfsxattrat should return EOPNOTSUPP as it make more sense
>   than ENOIOCTLCMD
> - ioctl_setflags returns ENOIOCTLCMD which also expected
>
> Don't really see a reason to change what vfs_fileattr_set() returns
> and then copying this if() to other places or start returning
> EOPNOTSUPP.

ENOIOCTLCMD conceptually means that the ioctl command is unknown
This is not the case since ->fileattr_[gs]et() became a vfs API
the ioctl command is handled by vfs and it is known, but individual
filesystems may not support it, so conceptually, returning EOPNOTSUPP
from ioctl() is more correct these days, exactly as is done with the ioctls
FS_IOC_FIEMAP and FIFREEZE which were also historically per fs
ioctls and made into a vfs API.

The fact that bcachefs does not implement ->fileattr_[gs]et() and does
implement FS_IOC_FS[GS]ETXATTR is an oversight IMO, since it
was probably merged after the vfs conversion patch.

This mistake means that bcachefs fileattr cannot be copied up by
ovl_copy_fileattr() which uses the vfs API and NOT the ioctl.

However, if you would made the internal vfs API change that I suggested,
it will have broken ovl_real_fileattr_get() and ovl_copy_fileattr(),
so leave it for now - if I care enough I can do it later together with
fixing the overlayfs and fuse code.

Thanks,
Amir.
