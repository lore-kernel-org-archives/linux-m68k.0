Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C23B8BC8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Mar 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827466; cv=none; b=t81tcj02bASScnjaYl/ZhbHsBU2A2egBXrKekad8dwowZgIf3zMP1wiE0gpeyMnST1GVH2eVCgKFjSCpsbRUeYk5uUHrCSMZo+RHpjTB+vgMvQ3gKV1zigc8RAvtz+C0pFqgjfKcNCplrSxqnEiiz1V4EVk0i6S5prpkusH5wn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827466; c=relaxed/simple;
	bh=rZ6XLqrSHLVYtGkiWq+/3mIvzZ8RhMzqjek4N8MpSH8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Kz3ENeZPIFRBXrB9gXrYoAD2zJ3nDXfc+b8wkP+F9hrFiN5Q0PEFCI2TV0NlL3GiFB4q5UDq+a4VAdNtr9JKzEpUbOWwliZtTrD9wAuV8FV6sIlVBjsBrjyXtqbF1HbmgyPAFN9xanMBZprW4kBHn5vGKAtziiNR1eJk5mifFrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g15FWJIk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g15FWJIk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so73422905e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Mar 2026 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773827455; x=1774432255; darn=lists.linux-m68k.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ6XLqrSHLVYtGkiWq+/3mIvzZ8RhMzqjek4N8MpSH8=;
        b=g15FWJIke2KkVEOxntr4amurNTU0H2Yp1xhAMJkIdKZMBN4nAP99ZiU3+0t12pUldf
         55MDnI4vR0U2MFA50l9w0zn/8TwyazYVb4PgHSA1Spa3R29O8fqL4omseGbcrYtK0MKK
         jaXNwckX97wrH0kdKpx/pgfjmOei3agOX+Og+nNxCVvjeLFiqCWTF+oj7hoeAumOo3Se
         kI3B5QHyBD0z6BWBPqsLMpr1If6+Za9JOQTZd1sZjIOluZF8ny/0sg1KhEKrh6giBjLz
         yZSGMmMnei0RQXHCP74OuaYcd2Unuzw9Zit0LQFgwkk3AY12LQRYBGAEX9mFPW7Q7sij
         RY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827455; x=1774432255;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZ6XLqrSHLVYtGkiWq+/3mIvzZ8RhMzqjek4N8MpSH8=;
        b=dcmKwv1u4zLCvcNXjopNfrqJ2RzHSv5P1zao2IRGmpAU+vZET0xBYJd8Te3vtu73ov
         kVbfS/5V6jo3hbGkJlswd2V177/4+voWPgpNYkGecuW7Rqg5FAddwdNJVXuua47Jv0/j
         NRda0V1XmAgclA42J/0lxvfGCE3RRPnX3C8YT4L+9ZP9fZH98iiNlwhEMI9qItqJOjHd
         7J0piwLn+gws316xlTR6cn1WLtxRWfO7XPzcxWv+RnxChzljXYRfEo5BuRaCIzBen5BQ
         +3ALLSPVf9+OtYb83/X/XPz0bTxye8PjsZVszGgAopArmkbM98QJN79YIm84EvjB+R7R
         x3CA==
X-Forwarded-Encrypted: i=1; AJvYcCVHAQWZo5sXzRP9puePggeWSXxapDCQQREGqi/jK/49/HUsBl/cQLzmVkTUwrf63kaXzv2WLBN59sr5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzFARdCp8eL1ogYLB2wYSh7E+1nQrTHktW274awATExlICPObsp
	A/sjJt3Klpt1kluc8qql5pCxl7MhhQpeJT2uZVBf49D/uOR4JwExCHbK09a0EIXEgXY=
X-Gm-Gg: ATEYQzwEtA4KR0uLvU6ecarxNc9DkdHwkJtZdu9YovhKjrhKDnnuVwqdMO+UPB4mkq3
	rpN4f8iagQOOe4EyItuWN1ccz+ATBpKljVO9jnHdc8ljkxgL2wYiJF4lEykTaEwD9XxrBA7Y1Yp
	b4Cq6D8I9QtkDaZRjtEyq+Tt3LfpFCIETCnUVFRqJrdvDscXyZZf2+YkZOcC9X4V52SB6pEsnbo
	vXdAXTEPg7FZBNB3eznvIed3NuHBfx1laowAevut0KUZm33c0UB8efD85+cKgoXoAhhAyGYd91O
	9OEO8nVpCaNOZ1sq3/I9DiQD8kvhGMwznH9yJOIaaoDjbU84PTF3QVJC+QzI2pOCYpaGAtn2yRH
	B2xWzrOwcqjict9LEIJc1sJ2p3lhPe5eZLkUeFdWXAU75STwyReM+KcRy9Fm0r/qntUD8xVAs0E
	stkcSs7H8QPb2X/TUvToE=
X-Received: by 2002:a05:600c:4612:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-486f442e710mr28542555e9.3.1773827454803;
        Wed, 18 Mar 2026 02:50:54 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a715f8b61sm13492337b3.44.2026.03.18.02.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 06:50:51 -0300
Message-Id: <DH5TCPI2CFJ2.ZBO1LQWYQUCO@suse.com>
Subject: Re: [PATCH 01/10 net-next v3] ipv6: convert CONFIG_IPV6 to built-in
 only and clean up Kconfigs
Cc: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>,
 "Selvin Xavier" <selvin.xavier@broadcom.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Ido Schimmel" <idosch@nvidia.com>, "Petr
 Machata" <petrm@nvidia.com>, "Simon Horman" <horms@kernel.org>, "Saurav
 Kashyap" <skashyap@marvell.com>, "Javed Hasan" <jhasan@marvell.com>,
 <GR-QLogic-Storage-Upstream@marvell.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Nilesh Javali" <njavali@marvell.com>,
 "Manish Rangankar" <mrangankar@marvell.com>, "Varun Prakash"
 <varun@chelsio.com>, "Alexander Aring" <aahringo@redhat.com>, "David
 Teigland" <teigland@redhat.com>, "Andreas Gruenbacher"
 <agruenba@redhat.com>, "Nikolay Aleksandrov" <razor@blackwall.org>, "David
 Ahern" <dsahern@kernel.org>, "Pablo Neira Ayuso" <pablo@netfilter.org>,
 "Florian Westphal" <fw@strlen.de>, "Phil Sutter" <phil@nwl.cc>, "David
 Howells" <dhowells@redhat.com>, "Marc Dionne" <marc.dionne@auristor.com>,
 "Marcelo Ricardo Leitner" <marcelo.leitner@gmail.com>, "Xin Long"
 <lucien.xin@gmail.com>, "Jon Maloy" <jmaloy@redhat.com>, "Bjorn Andersson"
 <bjorn.andersson@oss.qualcomm.com>, "Arnd Bergmann" <arnd@arndb.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Michal
 Simek" <michal.simek@amd.com>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Sven Peter" <sven@kernel.org>, "Lad Prabhakar"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "Kuninori Morimoto"
 <kuninori.morimoto.gx@renesas.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Kuan-Wei Chiu" <visitorckw@gmail.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Ryota Sakamoto"
 <sakamo.ryota@gmail.com>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Kir
 Chou" <note351@hotmail.com>, "David Gow" <david@davidgow.net>, "Vikas
 Gupta" <vikas.gupta@broadcom.com>, "Bhargava Marreddy"
 <bhargava.marreddy@broadcom.com>, "Rajashekar Hudumula"
 <rajashekar.hudumula@broadcom.com>, =?utf-8?q?Markus_Bl=C3=B6chl?=
 <markus@blochl.de>, <linux-kernel@vger.kernel.org>,
 <linux-m68k@lists.linux-m68k.org>, <linux-rdma@vger.kernel.org>,
 <oss-drivers@corigine.com>, <linux-scsi@vger.kernel.org>,
 <gfs2@lists.linux.dev>, <bridge@lists.linux.dev>,
 <netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
 <linux-afs@lists.infradead.org>, <linux-sctp@vger.kernel.org>,
 <tipc-discussion@lists.sourceforge.net>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Fernando
 Fernandez Mancera" <fmancera@suse.de>, <netdev@vger.kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260317140141.5723-1-fmancera@suse.de>
 <20260317140141.5723-2-fmancera@suse.de>
 <69dd007c-16d3-44c2-bc30-4e7f5a95addb@oss.qualcomm.com>
In-Reply-To: <69dd007c-16d3-44c2-bc30-4e7f5a95addb@oss.qualcomm.com>

On Wed Mar 18, 2026 at 3:51 AM -03, Krzysztof Kozlowski wrote:
> On 17/03/2026 15:00, Fernando Fernandez Mancera wrote:
>> Maintaining a modular IPv6 stack offers image size savings for specific
>> setups, this benefit is outweighed by the architectural burden it
>> imposes on the subsystems on implementation and maintenance. Therefore,
>> drop it.
>>=20
>> Change CONFIG_IPV6 from tristate to bool. Remove all Kconfig
>> dependencies across the tree that explicitly checked for IPV6=3Dm. In
>> addition, remove MODULE_DESCRIPTION(), MODULE_ALIAS(), MODULE_AUTHOR()
>> and MODULE_LICENSE().
>>=20
>> This is also replacing module_init() by device_initcall(). It is not
>> possible to use fs_initcall() as IPv4 does because that creates a race
>> condition on IPv6 addrconf.
>>=20
>> Finally, modify the default configs from CONFIG_IPV6=3Dm to CONFIG_IPV6=
=3Dy
>> except for m68k as according to the bloat-o-meter the image is
>> increasing by 330KB~ and that isn't acceptable. Instead, disable IPv6 on
>> this architecture by default. This is aligned with m68k RAM requirements
>> and recommendations [1].
>>=20
>> [1] http://www.linux-m68k.org/faq/ram.html
>>=20
>> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
>> Tested-by: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>
> That's a Kconfig/defconfig only patch, so build system. You cannot test
> it in a meaning of testing code. Building code is not testing.

Should I have sent 9 emails instead of 1 to the whole series?

>
>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> You removed important parts of Ack. It was not provided like that.
>
> Best regards,
> Krzysztof

