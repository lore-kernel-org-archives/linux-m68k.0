Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD43B4EB5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Mar 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773301891; cv=none; b=OojPZL/4LJxPfZoJUgLdGNOwPaWbOGWWPVbXtW/31H4goIYSGgXwe7o0tlKThycRH8XScbrp0Ra1kabEsjwh83QNj5SL1h0UNyDejgRIlnNEtO5CKvJWKusRh1PmfCYgZA+Das6YGq08UqWsyQNsSE4vh7DchdhVNyziAI58prM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773301891; c=relaxed/simple;
	bh=r2PdE6HYGVzZYpXyEn5kett8unUMILRQGQuMPOiuUPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjCrKMLN+i4H2M7ASSy3jJa9xUmAhPOFgDYFsDzaJSLmIgNd85fTVWWcgd+K3uJHkDuEbhzJULZW3nhWOHrq2QubHK1fHROMrCjmQa6+vN3Gp1AuYm/bWXex1+YoHmEdxeBEd/Hi6cSk1hzqJ+ljVWoBG7GdQwHccma8Pqcav+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aaed195901so4038105ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Mar 2026 00:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773301888; x=1773906688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LhKuHInA3JH1whpdNQPR6DLSzWmpT0VhZEHTHtHiaY=;
        b=pOxIA0JVYZg0cMue9QqQSAmaqjxqYdbYitP3Hx5wSRpS2E8wkxfcSEGB4FHiIdQiC+
         HeygACHxi7+eNBjO96xC5WOae7XMJo7AxlX+HtSw3Q/A7iZfzxaSXGQsxgm4ElDxW7jb
         C/YXIj9uUoszMB5AIQoRkp0GuW8NFgjNf5nQFIp8fw+Hf5mS+FDk3DB9HxnaUSOYvXDC
         L1lhEEIng6zOyi7m6Ds9pb4eA9CJszPrjia/cc+MuIR5MCfJuW++ueEKBEkwJr8h60hV
         aAU/nbnGOYuB/StrXeRG6lG8wDWJZyKkVQXRjF03jw3npVhDowrklz7r+ccJZ2s/nq5a
         Ms4g==
X-Forwarded-Encrypted: i=1; AJvYcCWbHF5g3v2YtfqBcEDLj0IMUeCac1pwiT7sl1j9vp/XQLSrwYJ0d246MZEIFL0AyQf/5tTqqgPd1cbo@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxl27KHcfFPnO04cMMFAJ511R6RkmDpbHK65CHBZv+di1/t+UsK
	3RRnhrNuWG5YtxrcWqmJN6tvKFQhKbMKxsWrDVjzOXCcFTcaA5Qf09M3e8R+BhdH7gZiog==
X-Gm-Gg: ATEYQzyKE31ToNQbF4FlzslcDghrJcVDEmOLFsfDXKJclhEMLCdVBGOlsPnEWCalgu3
	+ggDsSAU5pqMImL2aysqeGl1y+dXT8qxiJdO9D0FjhZnj7QmxwaZiQPV0GfPgUlkO+vAefBrH8q
	5MgFa6hHVJGfMhGD7IXRFLrwOMJFcG349jHbAgzNIN2x2PsWl8fwe62QfAo636aG4OnsZ0TBKhm
	oJShR4+OhTw7VlNagDFP23dP0MjRqC2Kjvp7e1wGY0FB+jdJXdlVZcR29HQ0i4qcscf3yDSrk3E
	wi9TD5YqIbYxF4jkKxerjpjks/LrRjBOjyosxmlFGGpMAZ/BP8b7J29XGCGO901xL6kzIjpKfK7
	sv1jIf/EP2C+LKHIx+OtV/R6zY4wvNBgEcQzc9gI7n/ohU9aEMHoqZVhOWwIS/V19cbBkkU0qL3
	rKQFKbALoESx1uzLyGwur+zpumsTLCUE9rHTO61XCVvAZ7dn4H/bCEw+6NnH4=
X-Received: by 2002:a17:902:d4cf:b0:2ae:aca4:b177 with SMTP id d9443c01a7336-2aeae795707mr54773135ad.5.1773301887584;
        Thu, 12 Mar 2026 00:51:27 -0700 (PDT)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com. [74.125.82.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae258e26sm45557195ad.37.2026.03.12.00.51.27
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 00:51:27 -0700 (PDT)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128ebee22caso854375c88.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Mar 2026 00:51:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWBp7R3X2i/3nwH9IW78Mm4qRWPehLRxG+Gb3YywDa1i3QKKkv/mcye2Y0/KxTZ2ACDZRJCxhprDID@lists.linux-m68k.org
X-Received: by 2002:a05:6122:1b0f:b0:56a:9f03:1719 with SMTP id
 71dfb90a1353d-56b47483c0fmr2043365e0c.7.1773301414536; Thu, 12 Mar 2026
 00:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310153506.5181-1-fmancera@suse.de> <20260310153506.5181-2-fmancera@suse.de>
In-Reply-To: <20260310153506.5181-2-fmancera@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Mar 2026 08:43:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWj-7J5bMq=wpv12CGaV7xtq7=O3nLHLvOT_odxOE4ueA@mail.gmail.com>
X-Gm-Features: AaiRm50vZ50YS2w5-6lod2s5W_kA6Ap8FK_nMN9HyVzDzz2AFRy7FAD50ZqnaYU
Message-ID: <CAMuHMdWj-7J5bMq=wpv12CGaV7xtq7=O3nLHLvOT_odxOE4ueA@mail.gmail.com>
Subject: Re: [PATCH 01/10 net-next v2] ipv6: convert CONFIG_IPV6 to built-in
 only and clean up Kconfigs
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, rbm@suse.com, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Selvin Xavier <selvin.xavier@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Saurav Kashyap <skashyap@marvell.com>, Javed Hasan <jhasan@marvell.com>, 
	"maintainer:BROADCOM BNX2FC 10 GIGABIT FCOE DRIVER" <GR-QLogic-Storage-Upstream@marvell.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <njavali@marvell.com>, 
	Manish Rangankar <mrangankar@marvell.com>, Varun Prakash <varun@chelsio.com>, 
	Alexander Aring <aahringo@redhat.com>, David Teigland <teigland@redhat.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	David Ahern <dsahern@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Jon Maloy <jmaloy@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Sven Peter <sven@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Gow <david@davidgow.net>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Kir Chou <note351@hotmail.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vikas Gupta <vikas.gupta@broadcom.com>, 
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>, 
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>, =?UTF-8?Q?Markus_Bl=C3=B6chl?= <markus@blochl.de>, 
	Heiner Kallweit <hkallweit1@gmail.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, 
	"open list:INFINIBAND SUBSYSTEM" <linux-rdma@vger.kernel.org>, 
	"open list:NETRONOME ETHERNET DRIVERS" <oss-drivers@corigine.com>, 
	"open list:BROADCOM BNX2FC 10 GIGABIT FCOE DRIVER" <linux-scsi@vger.kernel.org>, 
	"open list:DISTRIBUTED LOCK MANAGER (DLM)" <gfs2@lists.linux.dev>, "open list:ETHERNET BRIDGE" <bridge@lists.linux.dev>, 
	"open list:NETFILTER" <netfilter-devel@vger.kernel.org>, 
	"open list:NETFILTER" <coreteam@netfilter.org>, 
	"open list:RXRPC SOCKETS (AF_RXRPC)" <linux-afs@lists.infradead.org>, 
	"open list:SCTP PROTOCOL" <linux-sctp@vger.kernel.org>, 
	"open list:TIPC NETWORK LAYER" <tipc-discussion@lists.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"

Hi Fernando,

On Tue, 10 Mar 2026 at 16:37, Fernando Fernandez Mancera
<fmancera@suse.de> wrote:
> Maintaining a modular IPv6 stack offers image size and memory savings
> for specific setups, this benefit is outweighed by the architectural
> burden it imposes on the subsystems on implementation and maintenance.
> Therefore, drop it.
>
> Change CONFIG_IPV6 from tristate to bool. Remove all Kconfig
> dependencies across the tree that explicitly checked for IPV6=m. In
> addition, remove MODULE_DESCRIPTION(), MODULE_ALIAS(), MODULE_AUTHOR()
> and MODULE_LICENSE().
>
> This is also replacing module_init() by device_initcall(). It is not
> possible to use fs_initcall() as IPv4 does because that creates a race
> condition on IPv6 addrconf.
>
> Finally, modify the default configs from CONFIG_IPV6=m to CONFIG_IPV6=y
> except for m68k as according to the bloat-o-meter the image is
> increasing by 330KB~ and that isn't acceptable. Instead, disable IPv6 on
> this architecture by default. This is aligned with m68k RAM requirements
> and recommendations [1].
>
> [1] http://www.linux-m68k.org/faq/ram.html
>
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>

Thanks for your patch!

>  arch/m68k/configs/amiga_defconfig           | 45 +-------------------
>  arch/m68k/configs/apollo_defconfig          | 46 +-------------------
>  arch/m68k/configs/atari_defconfig           | 45 +-------------------
>  arch/m68k/configs/bvme6000_defconfig        | 45 +-------------------
>  arch/m68k/configs/hp300_defconfig           | 47 +--------------------
>  arch/m68k/configs/mac_defconfig             | 45 +-------------------
>  arch/m68k/configs/multi_defconfig           | 45 +-------------------
>  arch/m68k/configs/mvme147_defconfig         | 45 +-------------------
>  arch/m68k/configs/mvme16x_defconfig         | 45 +-------------------
>  arch/m68k/configs/q40_defconfig             | 45 +-------------------
>  arch/m68k/configs/sun3_defconfig            | 45 +-------------------
>  arch/m68k/configs/sun3x_defconfig           | 45 +-------------------

Why are the stats not the same for each file?

> --- a/arch/m68k/configs/apollo_defconfig
> +++ b/arch/m68k/configs/apollo_defconfig

> @@ -384,7 +343,6 @@ CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
>  CONFIG_LOGO=y
> -# CONFIG_LOGO_LINUX_VGA16 is not set

Unrelated change.

>  # CONFIG_LOGO_LINUX_CLUT224 is not set
>  CONFIG_HID=m
>  CONFIG_HIDRAW=y

> --- a/arch/m68k/configs/hp300_defconfig
> +++ b/arch/m68k/configs/hp300_defconfig

> @@ -386,8 +345,6 @@ CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
>  CONFIG_LOGO=y
> -# CONFIG_LOGO_LINUX_MONO is not set
> -# CONFIG_LOGO_LINUX_VGA16 is not set

Two more.

>  CONFIG_HID=m
>  CONFIG_HIDRAW=y
>  CONFIG_UHID=m

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
