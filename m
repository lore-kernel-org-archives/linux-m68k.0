Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8FE78F2F
	for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Mar 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742720199; cv=none; b=GZnU4p4tHoiuF+BDqQ6cSszIO5BBFaFZuCzpNEkt2w5ajjluSnulpNlKmq+uw/qtN5fgB5cMca75U8D2swwpZQWx/ouE6dzurl50j5YU5DxhPmR+7Pgn2PIG95WLoWZunI+kzZMkzlBSP2cm7unChGFER5nVhlBwh9KYeEXY6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742720199; c=relaxed/simple;
	bh=TJO9f5IdUVWtvEy9bUZKF/BDycaHHCYviXzt1jWheng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZctoo1JzKYOBZv9ASuBI7GuN0MXiCcvVpB91q+7LriynelVMUtfIUINTcC3Dc3CHbCNYUquu4ipz/czKDLjfaY/qKgoB5Lf5gAOq4XZUHs+gU1GCb5i95WjHCQSGOF+HBNnPDy736F1XLaiN/is4loMyN8CoLVRg/OM+1OWEnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWXIxA4a; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWXIxA4a"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so5745213a12.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Mar 2025 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742720196; x=1743324996; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVIItDI8qaPBoFm1BXeIX43KSyqYt1PldCeim8uGiMU=;
        b=ZWXIxA4aD1yhLJUqlLZOi4zQ9QWc/GF5saNvSkUP6bSoVreQ5xFKANz5L1MdXhEMKj
         utaWSdflogwpYpj3dck/70lGGKJxZubtq3+lnI+jm8pKcvdSW/1N6A/07nK58Mq9b4O5
         4RGjbjpwyxifpqyHSuQ+vCg5uYGvanf9m8qn5yp9EW/YFqZH2l3Wy/FXm9EIji0jJRwn
         F8AW7/ABrnxUp107cTZjICTilcSvUNIMS1S9/uWACWU49qvF4r6vDQkImG4JjdktBeYI
         bFeeea2VcJbTkGi7ZpzF+nUheU9gO9tsX7aQ1L8NI9K6KZ9L+YeA11AZMgr4cTweukN1
         wiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742720196; x=1743324996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVIItDI8qaPBoFm1BXeIX43KSyqYt1PldCeim8uGiMU=;
        b=X7OKeVqwJvMa7mAl/o4X23+UEGo0uT5BscDoxnTlXWXP2JUUj0hdsxYGPw6boTPEjc
         36o4mnpnK/Nc+jg+7aPTPQW5k0VEYfven1oXRabcVAIIys+rOkjHmX8BvhwcaXwdVIL7
         7l5X1bhh3qd8totC6ogVS+aqdWt3oPfGeRdy+nwueI4yeXQ5NawIhLOOIPmbYIjcCO/r
         Jw5VBAO/0H5hBJ27GtitkimlCz/fjE98HAKf+Vf7gI6Kv92QK3Ewx64wJWMoUWGS/nSW
         C5gq6Lfaea0VOlwkz7/BYPWmvyFARFF+Okcz9HD3UrV1mIkDyFkGEzVc+evrLEurZIVh
         TY6A==
X-Forwarded-Encrypted: i=1; AJvYcCUw4mBu7oNURUsyc573tafZh81MyLWqzWvfRiNFGSNfS8A/3CirZh65bUO/PDZb8bBqKb6oBBmB4yrk@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxncBQGkdQ0t6fqaJs9cxcZ9I9dIl5YEMYQpbSmwnksu1ITPMRI
	qssstjAHAJsu3Yl7fBLffbEIEBiYjiHw+AJvXlwJtB84Ho5ox6ncWlNEyFl0qfKNv4ktHExaPw3
	vv/yS887cO8LCt+oukj9Re64oQ70=
X-Gm-Gg: ASbGncttdHyOozPpwLo4REv7/KerW55flj4RFwIdYDvYS1T8wjXkNJeqc+0jF2urHGl
	sHASxM94aIrJZI4qOyRUPF1ZILZevjCC2k9MANTi6Ect+DpXDYfvtGlvrbhqT4dAb0zizvTT58e
	wJAVaiLIc2BBjjzm8DbK1xIcIU2Z16c7noEjsajbJulqtbqX7c7PijcKd1XaM=
X-Google-Smtp-Source: AGHT+IEBIy49ieatYEuSP1liKg/ID7cKJrCF9akLUZmVZ5wo1f/yMQ0YfYjV0MMVM+aDi+JYvMnWAUZwuWv6wUTqP1A=
X-Received: by 2002:a05:6402:2753:b0:5e7:8501:8c86 with SMTP id
 4fb4d7f45d1cf-5ebcd4f4378mr8004815a12.22.1742720195296; Sun, 23 Mar 2025
 01:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org> <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 23 Mar 2025 09:56:25 +0100
X-Gm-Features: AQ5f1JrOXpIKV6C3iY7Wt_BJVbE3r_yhhr0gjM9ov_K98R8Pcb1AHPHKowO0lbc
Message-ID: <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
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

On Fri, Mar 21, 2025 at 8:49=E2=80=AFPM Andrey Albershteyn <aalbersh@redhat=
.com> wrote:
>
> From: Andrey Albershteyn <aalbersh@redhat.com>
>
> Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> extended attributes/flags. The syscalls take parent directory fd and
> path to the child together with struct fsxattr.
>
> This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> that file don't need to be open as we can reference it with a path
> instead of fd. By having this we can manipulated inode extended
> attributes not only on regular files but also on special ones. This
> is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> we can not call ioctl() directly on the filesystem inode using fd.
>
> This patch adds two new syscalls which allows userspace to get/set
> extended inode attributes on special files by using parent directory
> and a path - *at() like syscall.
>
> CC: linux-api@vger.kernel.org
> CC: linux-fsdevel@vger.kernel.org
> CC: linux-xfs@vger.kernel.org
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
...
> +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filename,
> +               struct fsxattr __user *, ufsx, size_t, usize,
> +               unsigned int, at_flags)
> +{
> +       struct fileattr fa;
> +       struct path filepath;
> +       int error;
> +       unsigned int lookup_flags =3D 0;
> +       struct filename *name;
> +       struct mnt_idmap *idmap;.

> +       struct dentry *dentry;
> +       struct vfsmount *mnt;
> +       struct fsxattr fsx =3D {};
> +
> +       BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> +       BUILD_BUG_ON(sizeof(struct fsxattr) !=3D FSXATTR_SIZE_LATEST);
> +
> +       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) !=3D 0)
> +               return -EINVAL;
> +
> +       if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> +               lookup_flags |=3D LOOKUP_FOLLOW;
> +
> +       if (at_flags & AT_EMPTY_PATH)
> +               lookup_flags |=3D LOOKUP_EMPTY;
> +
> +       if (usize > PAGE_SIZE)
> +               return -E2BIG;
> +
> +       if (usize < FSXATTR_SIZE_VER0)
> +               return -EINVAL;
> +
> +       error =3D copy_struct_from_user(&fsx, sizeof(struct fsxattr), ufs=
x, usize);
> +       if (error)
> +               return error;
> +
> +       fsxattr_to_fileattr(&fsx, &fa);
> +
> +       name =3D getname_maybe_null(filename, at_flags);
> +       if (!name) {
> +               CLASS(fd, f)(dfd);
> +
> +               if (fd_empty(f))
> +                       return -EBADF;
> +
> +               idmap =3D file_mnt_idmap(fd_file(f));
> +               dentry =3D file_dentry(fd_file(f));
> +               mnt =3D fd_file(f)->f_path.mnt;
> +       } else {
> +               error =3D filename_lookup(dfd, name, lookup_flags, &filep=
ath,
> +                                       NULL);
> +               if (error)
> +                       return error;
> +
> +               idmap =3D mnt_idmap(filepath.mnt);
> +               dentry =3D filepath.dentry;
> +               mnt =3D filepath.mnt;
> +       }
> +
> +       error =3D mnt_want_write(mnt);
> +       if (!error) {
> +               error =3D vfs_fileattr_set(idmap, dentry, &fa);
> +               if (error =3D=3D -ENOIOCTLCMD)
> +                       error =3D -EOPNOTSUPP;

This is awkward.
vfs_fileattr_set() should return -EOPNOTSUPP.
ioctl_setflags() could maybe convert it to -ENOIOCTLCMD,
but looking at similar cases ioctl_fiemap(), ioctl_fsfreeze() the
ioctl returns -EOPNOTSUPP.

I don't think it is necessarily a bad idea to start returning
 -EOPNOTSUPP instead of -ENOIOCTLCMD for the ioctl
because that really reflects the fact that the ioctl is now implemented
in vfs and not in the specific fs.

and I think it would not be a bad idea at all to make that change
together with the merge of the syscalls as a sort of hint to userspace
that uses the ioctl, that the sycalls API exists.

Thanks,
Amir.
