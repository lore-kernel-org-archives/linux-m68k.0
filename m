From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [fengguang.wu@intel.com: [pnfs:xfs-nfsd-clone]
 57b7d25bf4c57ebe0fbd2d8c5b37edf503175e1f BUILD DONE]
Date: Thu, 18 Feb 2016 15:06:14 +0100
Message-ID: <CAMuHMdVixG0ihW4pMG7Zv3RgQ+g4nTfof0o4P_kmu7RRFyE9Rg@mail.gmail.com>
References: <20160218133240.GA5228@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160218133240.GA5228@lst.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: xfs@oss.sgi.com, "Darrick J. Wong" <darrick.wong@oracle.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Christoph,

On Thu, Feb 18, 2016 at 2:32 PM, Christoph Hellwig <hch@lst.de> wrote:
> Looks like the structure size checker found it's first victim on m68k,
> which doesn't seem to pad to 4 byte boundaries.  I don't think it actually
> matters in practice as we'll always the hacky appromiation of a variable
> sized array behind it.  I guess we should move this to a modern C99 VLA
> and mark it as __packed?

Marking it __packed causes the compiler to assume that the other 32-bit
values may not be aligned.

You can add 2 padding bytes to struct xfs_attr_leaf_name_remote.
Or change name[1] to name[3].

> ----- Forwarded message from kbuild test robot <fengguang.wu@intel.com> -----
>
> Date: Thu, 18 Feb 2016 21:26:23 +0800
> From: kbuild test robot <fengguang.wu@intel.com>
> Subject: [pnfs:xfs-nfsd-clone] 57b7d25bf4c57ebe0fbd2d8c5b37edf503175e1f
>         BUILD DONE
> To: Christoph Hellwig <hch@lst.de>
>
> git://git.infradead.org/users/hch/pnfs.git  xfs-nfsd-clone
> 57b7d25bf4c57ebe0fbd2d8c5b37edf503175e1f  nfs4: fix stateid handling for the NFS v4.2 operations
>
> fs/xfs/xfs_ondisk.h:22:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
> fs/xfs/xfs_ondisk.h:74:2: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
> include/linux/compiler.h:502:38: error: call to '__compiletime_assert_74' declared with attribute error: XFS: sizeof(xfs_attr_leaf_name_remote_t) is wrong, expected 12

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
