From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/3] kexec: Add debug printing of kimage table entries
Date: Tue, 15 Oct 2013 10:58:15 -0700
Message-ID: <1381859895.22110.30.camel__3422.93110811642$1381860588$gmane$org@joe-AO722>
References: <1381859307-11932-1-git-send-email-geert@linux-m68k.org>
	 <1381859307-11932-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381859307-11932-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>

On Tue, 2013-10-15 at 19:48 +0200, Geert Uytterhoeven wrote:
> Print a list of pages to be copied if debugging is enabled.
> Consecutive entries are merged to reduce screen clutter.
[]
> diff --git a/kernel/kexec.c b/kernel/kexec.c
[]
> +static void kimage_print_block(const struct kimage_block *block)
> +{
> +	pr_info("Copy from 0x%lx-0x%lx to 0x%lx-0x%lx (0x%lx bytes)\n",
> +		block->src, block->src + block->len - 1, block->dst,
> +		block->dst + block->len - 1, block->len);
> +}

Perhaps pr_debug and this maybe nicer to read like:

	pr_debug("kimage: Copy from 0x%lx-0x%lx to 0x%lx-0x%lx (0x%lx bytes)\n",
		 block->src, block->src + block->len - 1,
		 block->dst, block->dst + block->len - 1,
		 block->len);

Using a "kimage: " prefix could help grep too.
