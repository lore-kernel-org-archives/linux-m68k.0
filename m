Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850503587D9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222498; cv=none; b=JhEaSL0ejhDggitfqwQzxgfTd0KAMNkIxQhuY6P7aTzuhwmO/3qATFZFLBqcqleFG887h7a8H20j1xaUKxXRZnGvvrf9pljz6tG7pwWJX5uKQ16/oodjluKERetZI5ZZvnCzuUPZvku/2y5EhT0SAWDFaMgpsS8iWta5kenaH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222498; c=relaxed/simple;
	bh=XU1R8eEmf+8OcV6QhVEoFS8ffVTmlKxgnjEPke2eHaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=O1z6CD5CCIiOomAJOqQMP94kwB6aWTxQJwUzqCsI/+SXpAq7aFw1UWTAvjxEYzeqlZCtsA1AZNBRRc3y23a2bt9XHX2KYQ0etfZ31GCTTqeuBZPmrsuV2aSeD1+2EwsQCYujvCFttQqgHNGx5pplckeIvo+ceChWBqDXfyI9h+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFjprgGC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFjprgGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pTWpsZNjWgj8wv5f92UAOMouEbb8hc3HuMURULyk40=;
	b=hFjprgGCqq8Vp8OpTyCqc/KpHnzS2Jv6ahQP3sy79J1TfwZtLXSGm0X8JZYLCbus3fHtMz
	/hc5WPrVF4wY4+/6zd4q92Lb4QSEH9Kh/HZ5262n3YCHZWkoXslEc7UeXmK6RUgDKS+9gg
	AmrqJJY6bxmBUs8nHOw2rJ5BCwLG2T0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-cqtH9kNeMNS4qfqC58d8Sw-1; Mon, 12 Jan 2026 07:54:50 -0500
X-MC-Unique: cqtH9kNeMNS4qfqC58d8Sw-1
X-Mimecast-MFC-AGG-ID: cqtH9kNeMNS4qfqC58d8Sw_1768222489
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b871328f6caso96041066b.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 04:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222489; x=1768827289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pTWpsZNjWgj8wv5f92UAOMouEbb8hc3HuMURULyk40=;
        b=VT+k6ATonJWaLnt2lV0B5HmEYTqLEaJkSS5GLoogp/p0e/VONmgYBt0btbBZ+9tG2n
         vlVzq7r68N8fHx53gZ6CLZuOHTAUoCVqZ1YaGBzGyq7TIkIzZqp+PfMF5GC/hqsaDZpp
         2gAvSjHuBMe0vqSCt3jFQsQw24oaFRRk1AGDJs7NYmhxrIFu22OuxRdiuha8H6JkQErN
         VoFoh3ngRiGJMik/0YFSvIdROaepFBqC+hNCDK7RIRud/7+QruBY+mqazKT4FiFsHs9K
         aeRCOLEEAmNhVSLDvb0p014sM3wXc5HX79pFTTw/BKMVzDpsS1wNpgXH9CHxTAUSqrPu
         HOfA==
X-Forwarded-Encrypted: i=1; AJvYcCWCiJFcX8JgDlOz6OrRyTIlxHJYuidbmD0Gz03yj9F21dDNIrIwqW5fQQanAcmj4u////yPlQPkdgUI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw9UtO5ieUkDVYm4TGuhTpi5qVBtpgeDq0P07SSC5wtG+J8Vqy2
	ToOnKGTAsMjY6sO/vxJAKPAuZqicPbgOtBxa0gd8iBRd+mx3IJ+8Hkz7rFjKU0qpTH9khrdmATt
	YNX1A6WsnEtiCDdfP9i6j532+Y06ni9aUFSIbbobQULMo1f0r+RWAfQUwWydkW6IAgjg9fg==
X-Gm-Gg: AY/fxX6dL/xafHi25Q5OKePs1LsNTM3tfggLFJy8gwtWQp83h+hlxAjGfSB5e5Beo7Q
	N7d82RJCokdcS/IUI/0Nytb8JnOnznUpKOupuuk1g8ZdhlaNjIL4zPCEfUF5Y+x3W/AaNxW6Yh2
	Asj+i4+UXyDUb9wQBOIAOTde/64sKEbtl3ZBz5Gl0j5iS0GhOnxiFCTjhhNeajXbPkyn20CW5JA
	KeDSgYB1kAC2RYXSWRhBt07Lt1Xods7MiMOLnliu4kp4qCkarTgknBK+3Q2n7oUuqlCeBzP5rui
	3SNsMinZjDzSyFBf+/QBLPCp2yrbbl5TkWbwstlWj4u/2FHxQVBZ4Y001sXz8KY2TKuwBNhoz4P
	3qUj2pSBgWq4fnhJJZoWxOSNndYFbJ5DPuzZ0CFWnve6R61FaMb/9vrW0UDM=
X-Received: by 2002:a17:907:a0e:b0:b80:34e8:5eb with SMTP id a640c23a62f3a-b844542221cmr1612467266b.55.1768222489049;
        Mon, 12 Jan 2026 04:54:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7t8/HlV/5AlKScEccxcE3fk05AaGQ3PxxJdFkixgC3oQPqTZ4vVB050U3KXnraou/3iD9lw==
X-Received: by 2002:a17:907:a0e:b0:b80:34e8:5eb with SMTP id a640c23a62f3a-b844542221cmr1612464966b.55.1768222488577;
        Mon, 12 Jan 2026 04:54:48 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:48 -0800 (PST)
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
Subject: [RFC PATCH 2/5] selftests: net: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:28 +0100
Message-ID: <20260112125432.61218-3-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q5ZMvESBcgtyqi2JoynBaHEeS0GKKfhlv-YuluCq-xw_1768222489
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the selftests net kernel configuration to set NF_LOG_SYSLOG
and drop the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 tools/testing/selftests/net/netfilter/config | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index 12ce61fa15a8..f7b1f1299ff0 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -64,8 +64,7 @@ CONFIG_NF_CT_NETLINK=m
 CONFIG_NF_CT_PROTO_SCTP=y
 CONFIG_NF_FLOW_TABLE=m
 CONFIG_NF_FLOW_TABLE_INET=m
-CONFIG_NF_LOG_IPV4=m
-CONFIG_NF_LOG_IPV6=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_MASQUERADE=y
 CONFIG_NF_NAT_REDIRECT=y
-- 
2.52.0

