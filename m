From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 0/6] ata: Missing HAS_DMA dependencies
Date: Fri, 6 Jan 2017 11:37:17 -0500
Message-ID: <20170106163717.GA16083@mtj.duckdns.org>
References: <1483466989-9091-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-ide-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483466989-9091-1-git-send-email-geert@linux-m68k.org>
Sender: linux-ide-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Tue, Jan 03, 2017 at 07:09:43PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Bartlomiej's "[PATCH 1/3] ata: allow subsystem to be used on m68k arch"
> exposed a few missing dependencies on HAS_DMA. This series allows to
> build again "allmodconfig" and "allyesconfig" kernels tailored for
> Sun-3, which sets NO_DMA=y.

Applied to 1-6 to libata/for-4.11.

Thanks.

-- 
tejun
