Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13AF347C7
	for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Mar 2025 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742719520; cv=none; b=uZCwdHgBUQ5Qd5WAlYyq2C6qgM61vaA/PRnmjm822c8oTIwVPN34u0Sv88vBwe64kpZmm0Kyn10ybecCGC52OuiqgsxAz8Er6BplqNH5Ba5tzuMmakyVMpyBWgkq9rNv/wB1bnSqrAch8UmpiCa92lTnRPsXS0SXwhSBdH0rJ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742719520; c=relaxed/simple;
	bh=b7msV9pgJYlhEyRge9PfEcB6ipwT555t51j3Jg4i4JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COQWMcARqT6UVn10MHCcjF20rveoVYnA+17s5doYjkFoUFfnlCLWxC+xmYKIGyI5WIHqkM7j0A3vgd6xXm1wh2Fv17Hz1VO4VT3kcMyXBi3aOGL/yvG5fevx0PRyoAduqFAuj94Z1fa+24P05HM6x4qZAZk9rYsw4cTG2OxEYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKN9Yet1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKN9Yet1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso246470a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Mar 2025 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742719517; x=1743324317; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jxIP2TIUbDJlhhIEkW541D6lu1Z7/8FzD6NZfb9i/w=;
        b=nKN9Yet1tCxQAzYqFyH7PCx0grI7s6J9056UyGUcoVFWNAisaxu+BeD6st+pg0yXoW
         qBfdBuS/qXAtDNMIchx3/HeFvfndYx8gDDD/BZ/yKi1ATjTvvIxXZo8ppZpZgK7AE76v
         fY8cSdGFTdf6azboS0W5su9/yGrTUxhakxLLpei0jlPQL9W6WZ00AyFBgO/aYpB8g1w6
         xba352p8DFkQY8qBtwvwXWV3cwlIIlMAzgJ8WpoxTck2plFCNS6qIa/r3DZ/yzw5h2/f
         jzwV5DrEZ7Z0RnmaEZldr8QgLQ8+By9oRYIOU6m/EoC+NUls8ylWbAzLcb8msEq7pdG9
         5fGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742719517; x=1743324317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jxIP2TIUbDJlhhIEkW541D6lu1Z7/8FzD6NZfb9i/w=;
        b=HdchKWugjJ8N4EOr9QITVE2hzZH826Xaj/8nTz/KisMjDSymjDVuUXD3gNgT7h6RId
         XmIpNxV409vlL81dHlyQR5G0AsvFEFRnAnFoqmJExbMT0qY8zdFRQs0nBlM/bmiqhOXk
         U8I7EPg2jO91+kLU1pX9oWkDUpVoL1SjIXlB2QhCmFGDhrJx16ggzABoMAjebMu5A42r
         qoXUzSjSE8yTuoSZP/GiTKEaILnhGFJNow2nAjmBr21gUBT/R4mOpV7DTFYEG5W2RbeY
         V/cbNDXoCFMGuV/LyqqnuEu9eJkGKkdQveIprf1LW5UAlf6rEJ1w70D5h4ZqphVWJsDz
         oEkA==
X-Forwarded-Encrypted: i=1; AJvYcCUbJs11JwnZNFwWHcEVzYeb6RHUGANnDHI4/4cCOhahp0GI4hV8F6tB6QBsUfl2q6FQhEYqKZ9Foqn0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxGXqWX//NeRZcvTFuH267fxQhOkHdsrjCZPESBX4ATuixeDstR
	7BhIfcDV/5l48f+CAr5f2owVonb9B+X9t6fyi33wHBteIjlhvnbFWomlFslz5o98I2hMsREvs6V
	4j2sMpUMRtsbSjsxZ5uWV3wiA5P8=
X-Gm-Gg: ASbGncvBzrtw16bv/6Vi8oGDepef99Ez7crWTUZPcfyUfwbc/zr3nRpRPfGYJFHWiMy
	p8Vr9Eups2TZJnRRw8qNO/KcSFURcMse3oQzg3yK1zUTebQAOXw7J5ye4mdypjSNXYQCkG0WtbT
	7CO1ZJAj3Nsh96QQawqLy92b+csBMAgyeYMryHvE2yPr5PCfmYIk/I8LYebAk=
X-Google-Smtp-Source: AGHT+IGKn4NZALUSEG+rHMaGWglZZduHpRclHK5w+Kv4NN031fphTZKyVC6h710/5c6HAafbvHO3fjsZw2YzDAeWHLw=
X-Received: by 2002:a05:6402:42c9:b0:5e5:854d:4d17 with SMTP id
 4fb4d7f45d1cf-5eb9a017821mr12555025a12.11.1742719516454; Sun, 23 Mar 2025
 01:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 23 Mar 2025 09:45:06 +0100
X-Gm-Features: AQ5f1JqljvGQqYT8xQtG-jZ8bGx-mNtzX8tKytu1uegIaEXtua4XQMAbrGMEflk
Message-ID: <CAOQ4uxjQDUg8HFG+mSxMkR54zen7nC2jttzOKqh13Bx-uosh3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] fs: introduce getfsxattrat and setfsxattrat syscalls
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
	linux-arch@vger.kernel.org, selinux@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 8:50=E2=80=AFPM Andrey Albershteyn <aalbersh@redhat=
.com> wrote:
>
> This patchset introduced two new syscalls getfsxattrat() and
> setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
> except they use *at() semantics. Therefore, there's no need to open the
> file to get an fd.
>
> These syscalls allow userspace to set filesystem inode attributes on
> special files. One of the usage examples is XFS quota projects.
>
> XFS has project quotas which could be attached to a directory. All
> new inodes in these directories inherit project ID set on parent
> directory.
>
> The project is created from userspace by opening and calling
> FS_IOC_FSSETXATTR on each inode. This is not possible for special
> files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> with empty project ID. Those inodes then are not shown in the quota
> accounting but still exist in the directory. This is not critical but in
> the case when special files are created in the directory with already
> existing project quota, these new inodes inherit extended attributes.
> This creates a mix of special files with and without attributes.
> Moreover, special files with attributes don't have a possibility to
> become clear or change the attributes. This, in turn, prevents userspace
> from re-creating quota project on these existing files.
>
> Christian, if this get in some mergeable state, please don't merge it
> yet. Amir suggested these syscalls better to use updated struct fsxattr
> with masking from Pali Roh=C3=A1r patchset, so, let's see how it goes.

Andrey,

To be honest I don't think it would be fair to delay your syscalls more
than needed.

If Pali can follow through and post patches on top of your syscalls for
next merge window that would be great, but otherwise, I think the
minimum requirement is that the syscalls return EINVAL if fsx_pad
is not zero. we can take it from there later.

We can always also increase the size of struct fsxattr, but let's first
use the padding space already available.

Thanks,
Amir.

>
> NAME
>
>         getfsxattrat/setfsxattrat - get/set filesystem inode attributes
>
> SYNOPSIS
>
>         #include <sys/syscall.h>    /* Definition of SYS_* constants */
>         #include <unistd.h>
>
>         long syscall(SYS_getfsxattrat, int dirfd, const char *pathname,
>                 struct fsxattr *fsx, size_t size,
>                 unsigned int at_flags);
>         long syscall(SYS_setfsxattrat, int dirfd, const char *pathname,
>                 struct fsxattr *fsx, size_t size,
>                 unsigned int at_flags);
>
>         Note: glibc doesn't provide for getfsxattrat()/setfsxattrat(),
>         use syscall(2) instead.
>
> DESCRIPTION
>
>         The syscalls take fd and path to the child together with struct
>         fsxattr. If path is absolute, fd is not used. If path is empty,
>         inode under fd is used to get/set attributes on.
>
>         This is an alternative to FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR
>         ioctl with a difference that file don't need to be open as we
>         can reference it with a path instead of fd. By having this we
>         can manipulated filesystem inode attributes not only on regular
>         files but also on special ones. This is not possible with
>         FS_IOC_FSSETXATTR ioctl as with special files we can not call
>         ioctl() directly on the filesystem inode using file descriptor.
>
> RETURN VALUE
>
>         On success, 0 is returned.  On error, -1 is returned, and errno
>         is set to indicate the error.
>
> ERRORS
>
>         EINVAL          Invalid at_flag specified (only
>                         AT_SYMLINK_NOFOLLOW and AT_EMPTY_PATH is
>                         supported).
>
>         EINVAL          Size was smaller than any known version of
>                         struct fsxattr.
>
>         EINVAL          Invalid combination of parameters provided in
>                         fsxattr for this type of file.
>
>         E2BIG           Size of input argument **struct fsxattr** is too
>                         big.
>
>         EBADF           Invalid file descriptor was provided.
>
>         EPERM           No permission to change this file.
>
>         EOPNOTSUPP      Filesystem does not support setting attributes
>                         on this type of inode
>
> HISTORY
>
>         Added in Linux 6.14.
>
> EXAMPLE
>
> Create directory and file "mkdir ./dir && touch ./dir/foo" and then
> execute the following program:
>
>         #include <fcntl.h>
>         #include <errno.h>
>         #include <string.h>
>         #include <linux/fs.h>
>         #include <stdio.h>
>         #include <sys/syscall.h>
>         #include <unistd.h>
>
>         int
>         main(int argc, char **argv) {
>                 int dfd;
>                 int error;
>                 struct fsxattr fsx;
>
>                 dfd =3D open("./dir", O_RDONLY);
>                 if (dfd =3D=3D -1) {
>                         printf("can not open ./dir");
>                         return dfd;
>                 }
>
>                 error =3D syscall(467, dfd, "./foo", &fsx, 0);
>                 if (error) {
>                         printf("can not call 467: %s", strerror(errno));
>                         return error;
>                 }
>
>                 printf("dir/foo flags: %d\n", fsx.fsx_xflags);
>
>                 fsx.fsx_xflags |=3D FS_XFLAG_NODUMP;
>                 error =3D syscall(468, dfd, "./foo", &fsx, 0);
>                 if (error) {
>                         printf("can not call 468: %s", strerror(errno));
>                         return error;
>                 }
>
>                 printf("dir/foo flags: %d\n", fsx.fsx_xflags);
>
>                 return error;
>         }
>
> SEE ALSO
>
>         ioctl(2), ioctl_iflags(2), ioctl_xfs_fsgetxattr(2)
>
> ---
> Changes in v4:
> - Use getname_maybe_null() for correct handling of dfd + path semantic
> - Remove restriction for special files on which flags are allowed
> - Utilize copy_struct_from_user() for better future compatibility
> - Add draft man page to cover letter
> - Convert -ENOIOCTLCMD to -EOPNOSUPP as more appropriate for syscall
> - Add missing __user to header declaration of syscalls
> - Link to v3: https://lore.kernel.org/r/20250211-xattrat-syscall-v3-1-a07=
d15f898b2@kernel.org
>
> Changes in v3:
> - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> - Remove unnecessary "same filesystem" check
> - Use CLASS() instead of directly calling fdget/fdput
> - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b3=
60d4fbcb2@kernel.org
>
> v1:
> https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@ker=
nel.org/
>
> Previous discussion:
> https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat=
.com/
>
> ---
> Andrey Albershteyn (3):
>       lsm: introduce new hooks for setting/getting inode fsxattr
>       fs: split fileattr/fsxattr converters into helpers
>       fs: introduce getfsxattrat and setfsxattrat syscalls
>
>  arch/alpha/kernel/syscalls/syscall.tbl      |   2 +
>  arch/arm/tools/syscall.tbl                  |   2 +
>  arch/arm64/tools/syscall_32.tbl             |   2 +
>  arch/m68k/kernel/syscalls/syscall.tbl       |   2 +
>  arch/microblaze/kernel/syscalls/syscall.tbl |   2 +
>  arch/mips/kernel/syscalls/syscall_n32.tbl   |   2 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl   |   2 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl   |   2 +
>  arch/parisc/kernel/syscalls/syscall.tbl     |   2 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    |   2 +
>  arch/s390/kernel/syscalls/syscall.tbl       |   2 +
>  arch/sh/kernel/syscalls/syscall.tbl         |   2 +
>  arch/sparc/kernel/syscalls/syscall.tbl      |   2 +
>  arch/x86/entry/syscalls/syscall_32.tbl      |   2 +
>  arch/x86/entry/syscalls/syscall_64.tbl      |   2 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     |   2 +
>  fs/inode.c                                  | 130 ++++++++++++++++++++++=
++++++
>  fs/ioctl.c                                  |  39 ++++++---
>  include/linux/fileattr.h                    |   2 +
>  include/linux/lsm_hook_defs.h               |   4 +
>  include/linux/security.h                    |  16 ++++
>  include/linux/syscalls.h                    |   6 ++
>  include/uapi/asm-generic/unistd.h           |   8 +-
>  include/uapi/linux/fs.h                     |   3 +
>  security/security.c                         |  32 +++++++
>  25 files changed, 259 insertions(+), 13 deletions(-)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250114-xattrat-syscall-6a1136d2db59
>
> Best regards,
> --
> Andrey Albershteyn <aalbersh@kernel.org>
>
>
