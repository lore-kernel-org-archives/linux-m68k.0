From: Christoph Hellwig <hch@lst.de>
Subject: Re: [fengguang.wu@intel.com: [pnfs:xfs-nfsd-clone]
	57b7d25bf4c57ebe0fbd2d8c5b37edf503175e1f BUILD DONE]
Date: Mon, 22 Feb 2016 10:05:14 +0100
Message-ID: <20160222090514.GA19746@lst.de>
References: <20160218133240.GA5228@lst.de> <CAMuHMdVixG0ihW4pMG7Zv3RgQ+g4nTfof0o4P_kmu7RRFyE9Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVixG0ihW4pMG7Zv3RgQ+g4nTfof0o4P_kmu7RRFyE9Rg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Thu, Feb 18, 2016 at 03:06:14PM +0100, Geert Uytterhoeven wrote:
> Marking it __packed causes the compiler to assume that the other 32-bit
> values may not be aligned.
> 
> You can add 2 padding bytes to struct xfs_attr_leaf_name_remote.
> Or change name[1] to name[3].

All not really exciting.  Given that we never do a sizeof it might
make sense to simply not check the size of this structure as a band aid.
