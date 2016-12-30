From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/3] ata: allow subsystem to be used on m68k arch
Date: Fri, 30 Dec 2016 06:12:49 -0800
Message-ID: <20161230141249.GA4543__35000.9448746734$1483107190$gmane$org@infradead.org>
References: <1483106478-1382-1-git-send-email-b.zolnierkie@samsung.com>
 <CGME20161230140141epcas5p161d9467e10e294f502863b5347e351d5@epcas5p1.samsung.com>
 <1483106478-1382-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483106478-1382-2-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Tejun Heo <tj@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Fri, Dec 30, 2016 at 03:01:16PM +0100, Bartlomiej Zolnierkiewicz wrote:
> When libata was merged m68k lacked IOMAP support.  This has not been
> true for a long time now so allow subsystem to be used on m68k.

Is that dependency needed at all anymore?  What exact functionality
is missing on m32r and s390?
