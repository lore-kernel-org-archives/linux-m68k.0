Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9C61C3F0C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Mar 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217659; cv=none; b=ZyR2FvN6FdpsPI569kXiczATLGLtiaOFYvej5VaV9m46nu/gi8Drw0Zt3WuHBcU+So1lmvgvgzqMXaFCJ685Yw660DoYBDHbxekoFElnke4yvy/BaS4SmvqFCpMUl1yTRu7DhhTzNh/3h2zdV5s7jBs3kOgkTvDK11DFdSSz868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217659; c=relaxed/simple;
	bh=62QCpDXQ19DuCkEVmsTIfiPIA4bbzZLKZDd0zU0n8k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSok+/8yI5m0bMXtqfJWIE/wlj3W6ReoxPARXj1U2/XMio/ZPQZEmmn6hVQlZhTIH3jWSnB9j9nn0jUykfZkQ9uJf0BvbyBzDGFSf840LniyUJTkn1fIY9pPVwuZfmpJh/mp8sRWrb14Y4IUEENRGEu9kXFBrdvvx6WPVdTJI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50905b779dfso46165871cf.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Mar 2026 01:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217657; x=1773822457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPUxC4UVYYzFR5WbkDP1rfKgT9C5RxhWe2cP85gtoTg=;
        b=GMNF56KrfH6ueY3ysEly9hN3/M9ziib3bHEqq/UWcI42ynbc3I1BW6RXxE9UDLAJwZ
         kuW3OLG0Gxb9W/W16+RZQDwIvvSV4HV8WlAJ8TEDeAlvHctQ741Uh1zE4/tFoc1CggEo
         qo9QVlXVCLPkP/czLVvQIiVIg0TGH04cbntWgvl5W+thxNXAMEjIdlyiTcdc4TrS9XOQ
         eXlYfVF2NHnWnL1IJYkY1wCpaSqoKOS7UG6BtBrI08Pns1bbdWfgzZQ7gbhFlLo1Wxhv
         tTQvDjzvkTSGcxzsR2fLcghXF39fCvMb+PqDO3uK0aeoOWamE5Ig5mPvhAhhF8tJwtNg
         N+6g==
X-Forwarded-Encrypted: i=1; AJvYcCVMSlHcCS1o0e+J3g1YD0EQ14dWiZ5Nrf8r/xCYZoGhRW6jvv/XzStiT6GGn7S8fJXh8rD3niir1ApZ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzMJIO4X2vh/dpCRBv6wqkeDtk2OwPiW7av4lP0DoRs/KZdf7Bl
	2krq0iEW1Fma7Ll+sscp9PoKL0orFLZd8WVCnA88ma4Zxui3CBZJqHYwIYjivCck
X-Gm-Gg: ATEYQzxt3qmNbMWXLvHFuXJXd41GLZWcd6tbU5KID5a78qBO4S5liczxH7ueH2hxHWb
	RlzT6MU94+ZMMTZ+6D6PV8sE4vmCodGM1lnr/KNUE8BareSPTgH5kVO9grY4R2OLbNs8uC0aeUi
	2A4epRXAvv5Nn8goFL6Pu6DMXcYZdqIPxjygfCHp2zM+4wKi3gyWy1MlJUcA98ioWXmbDAGZMVv
	GyWUIeUmekJKHK4td6kVaaWHWpebYE62Zk4c0qp1RGNi0Ov7v4HxOneauVLxceZWJyIJCI4YBYy
	e7+zw6m7o7n0vyG+8EVg3VkNm44CSTbGVPZkiYWpKfn/x7qSxM9FKCWodLHrAce0XcAEr2gxroP
	SfTBb3k2pip4J4e5o6lojxBH5r2NxyCFyeIj2i3LVtJ5WeovQr7BzNDEjd9Q/QhHlAGaBsdh+Fr
	OZ5/FeNsPSXK2nu5NxgRqAQks/FeMsZwIerrtMysEXNtE+jSSOJN0lGV0IQETvwlix52VZG3I=
X-Received: by 2002:ac8:588a:0:b0:509:39b1:d4b8 with SMTP id d75a77b69052e-5093a17bbdbmr19309901cf.45.1773217657201;
        Wed, 11 Mar 2026 01:27:37 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bea06dsm9771676d6.12.2026.03.11.01.27.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:27:37 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89a1c6dd788so127638566d6.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Mar 2026 01:27:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXV2CVKgVc8IdijQIyUfsQzJvzaTNk6TIPKQVN2sdExeO6RGq0u5o7Iz7KU16okEaGFOiOh8wIyUtK1@lists.linux-m68k.org
X-Received: by 2002:a05:6102:290c:b0:5ff:d192:ff22 with SMTP id
 ada2fe7eead31-601deec1db1mr739173137.19.1773217280031; Wed, 11 Mar 2026
 01:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022013.5199-1-fmancera@suse.de> <20260309022013.5199-2-fmancera@suse.de>
 <01a4936f-77cd-4c60-a1be-cabec872a2bb@kernel.org> <e54d887c-5a70-b8c9-aeef-433c5134dd14@kolla.no>
 <5c4b6043-a484-479d-83bc-a86ecdb8f810@app.fastmail.com>
In-Reply-To: <5c4b6043-a484-479d-83bc-a86ecdb8f810@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 09:21:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWec3Xwi1ma22D_eqs3OqRJXEt4=YmWvO2MgtBdSpNuqg@mail.gmail.com>
X-Gm-Features: AaiRm52Q0QeELW2kE8F3ZB9XQa9qhSRDKWOoNuroUdAnxhN87qOfxCDKsawyRAY
Message-ID: <CAMuHMdWec3Xwi1ma22D_eqs3OqRJXEt4=YmWvO2MgtBdSpNuqg@mail.gmail.com>
Subject: Re: [PATCH 01/10 net-next] ipv6: convert CONFIG_IPV6 to built-in only
 and clean up Kconfigs
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Fernando Fernandez Mancera <fmancera@suse.de>, Netdev <netdev@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Selvin Xavier <selvin.xavier@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Saurav Kashyap <skashyap@marvell.com>, Javed Hasan <jhasan@marvell.com>, 
	"maintainer:BROADCOM BNX2FC 10 GIGABIT FCOE DRIVER" <GR-QLogic-Storage-Upstream@marvell.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
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
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Sven Peter <sven@kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Gow <david@davidgow.net>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kir Chou <note351@hotmail.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, Vikas Gupta <vikas.gupta@broadcom.com>, 
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>, 
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>, =?UTF-8?Q?Markus_Bl=C3=B6chl?= <markus@blochl.de>, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Mar 2026 at 20:58, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Mar 10, 2026, at 20:40, Kolbj=C3=B8rn Barmen wrote:
> > On Mon, 9 Mar 2026, Krzysztof Kozlowski wrote:
> >> On 09/03/2026 03:19, Fernando Fernandez Mancera wrote:
> >>
> >> It must stay module for me. Alternatively, drop it, but then some user=
s
> >> will be really affected.
> >
> > I agree. If anything I would prefer to see IPv4 be made optional (and
> > modular) as well, and not as something IPv6 depends on, it's (AFAIK)
> > impossible today to build an IPv6-only Linux kernel.
>
> My first feeling was that this is a bad idea as well. On the other hand

Exactly my feeling. That's why I stayed quiet for a while, and gave
it some thought...

> I found that the default changed from =3Dm to -y over 10 years ago, all
> recent distros listed in https://github.com/nyrahul/linux-kernel-configs
> use that default (the only two exceptions are board specific builds
> of Debian and Ubuntu for linux-5.x).

Thanks, that is something I was wondering too.

Obviously the world is moving the IPv6 (but having IPv6=3Dm doesn't
preclude that!).  From the other side, there is a trend to have as much
as possible in modules instead of built-in.  A larger base kernel not
only has impact on memory usage (and loading modules has, too), but
also on e.g. boot partitions.  Various platform-specific limitations
may be at play (boot loader size limits, boot partition size limits,
base kernel must fit in the first memory block on systems with many
small discontiguous memory blocks, ...).

But apparently even the Android gki_defconfig (which is not on the
page mentioned above?) has IPv6 built-in.

Back to the numbers:
  - base kernel: atari_defconfig (CONFIG_IPv6=3Dm)
  - with this series, CONFIG_IPv6=3Dn: -22 KiB
  - with this series, CONFIG_IPv6=3Dy: +246 KiB
Note that I ignored any defconfig changes in these series.
The size impact is almost the same for v1 and v2, but only v2 boots.

Each new kernel release increases kernel size by ca. 30-40 KiB on
average.  So a one-time increase of 246 KiB is not unsurmountable,
and slightly less than the increase between v6.14 and v6.19...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
