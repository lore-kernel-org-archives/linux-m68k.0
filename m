Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7709C30F545
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222488; cv=none; b=Bfnh/USUNdHnvy97j0752yJEc0XokovAFxbJQdmTK9/SXMQYNqdG3jVxRmwQFSBuIudG2xvSWAoYA87Cj+rYmuRXpSjsR7+ZKIWKGlLllOB4o4hGQki+y0milf/SOJEW7jbhuZgI8y26NaD7Me5vZ78SL6w9xHtbw4HOuz/Gh2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222488; c=relaxed/simple;
	bh=ArVVBiqIBetgJi+p5f+cmJSVHQwk79p7Tqq1GTf/FIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=WE6lg3Vzgif3trsHVin4GPvcYqPToPGGds5wvKC+z/ItyQuqYr8VdB2wdmyAuASGl2kzcnEXXegQY1W4UBTPBCFKesrPd9lL65dwByJ0eQ93NEO0yRuVCfu4KUfjYtciZIoySHHnc1FEAUmHlEKN6TpHlJMHF08ppjxHni1I3mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ExAuEuAc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ExAuEuAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iKF0BzHe4DoMZWSEsankET3G7Dd2Xauwml8GRRGytpc=;
	b=ExAuEuAcsD1oiA8r9Yl7BNekcNgkIKmQtIE8zH9/BypO8czs/3fY0SNw6a79zW5e+xjikT
	gu/e5Ty8DvhTaBun7GfH/D/Nr3gHR+xVD/+UMBPiuInl9d+gct7Y3X/WwQsg5ySZSwa6nq
	qp0XX+QhRSf1rNwuaT/I1kL7AssxDdM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-s-NVB_ZNNsye37f2OqIt6Q-1; Mon, 12 Jan 2026 07:54:42 -0500
X-MC-Unique: s-NVB_ZNNsye37f2OqIt6Q-1
X-Mimecast-MFC-AGG-ID: s-NVB_ZNNsye37f2OqIt6Q_1768222481
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b844098869cso649593266b.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 04:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222481; x=1768827281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKF0BzHe4DoMZWSEsankET3G7Dd2Xauwml8GRRGytpc=;
        b=fWoRRjXlr6UtypxbZxtQsJEDiBkhApwR6dfWxuamZFZnMhagORKKViLkTe4QJS2Phb
         T/cWmvpKJgzs1TnGrX3JFVk/f96L/XwKEK7WzYdP61Vx8J1WrLJQ89McA46hXbdPNXOS
         5LF/kC+YqkYS7Mu8G7ChoD+S20qwa9s2RfyEuXMKasW1g9NKZ5FamGJ02e67YPblpVZx
         a0gh1X1KHdLU03Uvmc1D2zXwytGaZM3yeLK55ipd8pL+wmUt7OLqxO8yrjFGifYLSqKE
         LJ+zCmz0nGXgIUtwxF1gHGbvs8TaflBBzPRrS+Mm4cjCj/KuUvY7umPB0DHWSeQs6E52
         l41g==
X-Forwarded-Encrypted: i=1; AJvYcCVzbLvcLmJDrP6uwKQJaf3SJZuV4UorewC6Vwy/uniwC6wv/Y5TgWnNuvbwbZZvbyH5L75Th0DIMgkA@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxGyMH158wQ334w3bAXj9isU/0697SZbTA0LznnLLG1nj3hiQGS
	8veLlYgOTBtZIk6Z/aiGbvIop6nEzvorx5anScnRVfffuA8RrUgoSajnw6YjdIriRDXrC8PLoRk
	sax8YiGANuRuOQ/SEerHUq7VIfyjlI5Hi6/aXZwLAi7vpJuc1IXqxKoO0kMf7w9vhaY154Q==
X-Gm-Gg: AY/fxX4T/62/9QBn1pNwLAzSWugKb5IlI2qNpWuGnf/0OICvy9yRkGm7ABT+H5hflg2
	MPkLpNfMxWCzVcUqMKcjPebJSGi7ykcyXakhY6mingiYW9eeAd4G4HLcJoOitDCvxiIRFGF7X6M
	OMLUINnHLROuUyty819norgc9qZXVzMemwqXXkAGbwgc6GLt5EtQPazbebhHHSgekeLW+PMrugo
	J+nsTyL7a07gS7fpvHUjTy/G2AjJ5PHzPwRZxYlNcwg141QqtcDyDY3wCWpaDoDOEHA3BFPil2U
	4cicRbTOgdp67KU/swxcrttzcrp0UdvR+2cK3prFRUfCZF71GVwy+aWvSWUf2cRzaWuc7ju3Xt3
	WkdrYo6WohvAAp+3e3wk2WugW83BO/wXkQp1KvE2JKR8IrBjZ0tEAA04bwEE=
X-Received: by 2002:a17:907:a4a:b0:b83:8f35:773b with SMTP id a640c23a62f3a-b844501e49emr1772455366b.54.1768222480764;
        Mon, 12 Jan 2026 04:54:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSZz6AlBAsyDbYMyXJssyt5r14tT5j/dhOjPD0uwwtT32eYJd5F4wjSbE4zxf083DcjrlpEg==
X-Received: by 2002:a17:907:a4a:b0:b83:8f35:773b with SMTP id a640c23a62f3a-b844501e49emr1772452766b.54.1768222480270;
        Mon, 12 Jan 2026 04:54:40 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:39 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 0/5] net: make config options NF_LOG_{ARP,IPV4,IPV6} transitional
Date: Mon, 12 Jan 2026 13:54:26 +0100
Message-ID: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rqF9zL-cKJ2aM13ThGROGr2nxt8K0GNvAsBqWzJQ0vw_1768222481
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi,

This RFC patch series makes the config options NF_LOG_{ARP,IPV4,IPV6}
transitional. Recently, Kees Cook added a feature to kconfig to assist
transitioning deprecated config options. Here is a first RFC patch to apply
this feature for NF_LOG_{ARP,IPV4,IPV6}.

The plan is to mark all deprecated config options in net transitional, and
update the kernel configurations in the kernel tree to not use those
transitional config options. Then we leave these transitional config
options for a year or two to allow users that only update from one LTS to
the next to see that these config options are deprecated. After such a
grace period, we can finally drop these transitional config options.

This patch series is the manifestation of that plan for the three
deprecated options NF_LOG_{ARP,IPV4,IPV6}. If there is general agreement
that this is how deprecated config options are to be handled, then please
apply the patches 1 and 2 to the net-next tree.

Note that for the time being, as there is no dedicated kernel-wide Kconfig
file for collecting transitional config options right now, so simply adding
them at the end of the net/Kconfig file seems the best choice for now. 

The patches 3, 4 and 5 are added here to understand the complete treewide
change to transition the deprecated config options; I expect the patches
3, 4 and 5 to be applied by the corresponding arch maintainers, though.
Note that all patches in this series can be applied independently from each
other without causing any regression, i.e., if any patch 2 to 5 is applied
without patch 1, the resulting kernel configurations still enable the same
functionality as before as well as with patch 1 applied.

Once the general approach and patches are accepted, I plan to send some
further patch series to transition more net config options. My current
investigation identified that these further config options in net can be
transitioned:

  IP_NF_MATCH_ECN -> NETFILTER_XT_MATCH_ECN
  IP_NF_MATCH_TTL -> NETFILTER_XT_MATCH_HL
  IP_NF_TARGET_MASQUERADE -> NETFILTER_XT_TARGET_MASQUERADE
  IP_NF_TARGET_NETMAP -> NETFILTER_XT_TARGET_NETMAP
  IP_NF_TARGET_REDIRECT -> NETFILTER_XT_TARGET_REDIRECT
  IP_NF_TARGET_TTL -> NETFILTER_XT_TARGET_HL
  NETFILTER_XT_TARGET_CONNMARK -> NETFILTER_XT_CONNMARK
  NETFILTER_XT_TARGET_MARK -> NETFILTER_XT_MARK


Lukas


Lukas Bulwahn (5):
  net: make configs NF_LOG_{ARP,IPV4,IPV6} transitional
  selftests: net: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
  m68k: defconfig: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
  riscv: defconfig: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
  s390/configs: replace deprecated NF_LOG configs by NF_LOG_SYSLOG

 arch/m68k/configs/amiga_defconfig            |  3 +--
 arch/m68k/configs/apollo_defconfig           |  3 +--
 arch/m68k/configs/atari_defconfig            |  3 +--
 arch/m68k/configs/bvme6000_defconfig         |  3 +--
 arch/m68k/configs/hp300_defconfig            |  3 +--
 arch/m68k/configs/mac_defconfig              |  3 +--
 arch/m68k/configs/multi_defconfig            |  3 +--
 arch/m68k/configs/mvme147_defconfig          |  3 +--
 arch/m68k/configs/mvme16x_defconfig          |  3 +--
 arch/m68k/configs/q40_defconfig              |  3 +--
 arch/m68k/configs/sun3_defconfig             |  3 +--
 arch/m68k/configs/sun3x_defconfig            |  3 +--
 arch/riscv/configs/defconfig                 |  4 +---
 arch/s390/configs/debug_defconfig            |  2 +-
 arch/s390/configs/defconfig                  |  2 +-
 net/Kconfig                                  | 21 ++++++++++++++++++++
 net/ipv4/netfilter/Kconfig                   | 16 ---------------
 net/ipv6/netfilter/Kconfig                   |  8 --------
 net/netfilter/Kconfig                        |  1 +
 tools/testing/selftests/net/netfilter/config |  3 +--
 20 files changed, 38 insertions(+), 55 deletions(-)

-- 
2.52.0

