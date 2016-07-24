From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 12/15] binfmt_flat: allow compressed flat binary format to work on MMU systems
Date: Sun, 24 Jul 2016 21:48:55 +0200
Message-ID: <4262519.L4vdOGcrh0__12452.3398503245$1469389810$gmane$org@wuerfel>
References: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org> <1469374229-21585-13-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1469374229-21585-13-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-fsdevel@vger.kernel.org, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, linux-m68k@lists.linux-m68k.org, Alexander Viro <viro@zeniv.linux.org.uk>

On Sunday, July 24, 2016 11:30:26 AM CEST Nicolas Pitre wrote:
> +#else
> +                       /*
> +                        * This is used on MMU systems mainly for testing.
> +                        * Let's use a kernel buffer to simplify things.
> +                        */
> +                       long unz_text_len = text_len - sizeof(struct flat_hdr);
> +                       long unz_len = unz_text_len + full_data;
> +                       char *unz_data = vmalloc(unz_len);
> +                       if (!unz_data) {
> +                               result = -ENOMEM;
> 

Is there a risk of a malicious user exhausting vmalloc space with a
binary that has forged headers? If there is, maybe put an upper bound on
the size of allocation.

More broadly speaking, are there any other attacks that may get enabled
through forged binaries? We've had a couple of vulnerabilities in
binfmt_elf over the years, and I wonder how dangerous it might be
if distros turn on binfmt_flat support by default.

	Arnd
