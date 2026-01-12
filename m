Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5F3587CE
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222493; cv=none; b=d+q0JrXJxwOot46drVJVyNq6bQQJ5J4mUIcDX1FMpVOLRbkyC2U2NkD9Dc40H7XHWInA3l2pDbbD3CycfEnsqLDYDhHp3KeuNVSaw82YClb+zDR9y0m7n7dmUDkuMDonY1MyfI4ytq1lMcKgfvz2cKzO47Gy7ZkP/gZkcpAGvTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222493; c=relaxed/simple;
	bh=V7UrOAgbBjKbnTlNQ87vW7Z6nwRklkpYJYPGjtD9Pw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=r9E5i67AEfdN6Pw07Sa3mLVP3LRPDqb9+XJHUFyEkOxo/QrXKzmwmzuQsUC65cA6Z3LvP4odo3XjBm0+g7ZkkxGEcUv79sunIs/mHR/Q+gpZ2UIXUJJBXI/eUi0kXRZXbGzS04XMcRiCMQ4HGeugE2522E9DX+n5pth93pVKmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L9EbYjhv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L9EbYjhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/ujfx9fRHizDfrh38x0NK7m/HfIxQpjC07mOPX7fVQ=;
	b=L9EbYjhvgfkYYwUGL/LNBm7nNfZ+R9xQ1wcjXPRntrItQ3jfJyA2bL7Focn3drXQ5cahqV
	FpqVUE5YM6uPr4J1ldLdU+m0rAOp6uhtpLysEhotUSUTXrquKU7E2FjqsuFd72Pl6lzFEZ
	de/MV8EaS3vbcFCRiwhp23bjfM6Utyc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-SxAvTwtZObiIQXxn_KPbNw-1; Mon, 12 Jan 2026 07:54:46 -0500
X-MC-Unique: SxAvTwtZObiIQXxn_KPbNw-1
X-Mimecast-MFC-AGG-ID: SxAvTwtZObiIQXxn_KPbNw_1768222485
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b7a29e6f9a0so626152366b.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 04:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222485; x=1768827285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/ujfx9fRHizDfrh38x0NK7m/HfIxQpjC07mOPX7fVQ=;
        b=AgBo1PLGv+FC0e7yg68d4FgvG658i7UXgouuBQdOcAbbxnBUswjDdjF4gOq6hECnPd
         KqIfCsEgE7cFTA9jWlHH2Qk+R8vmRL4kTEyP/EXqMgFh0EG1x0jV8AHTBf9OGBzMA0fF
         JiBMkPxdYZlqugRb95z2z0E0i8oDuy0J78aPfSGG9SKKL8E7e6FLb4tHZMy0OT0ozj2X
         rHp/6331qNdpNlvDIL2ugOL2y0U+lRvp/CBPgQ4Hw/Z5DoDgTQ4FOEjSqAe4+wAOxmQG
         M7MXK59AufALUUyj+sNUUw0VWj5t4+hy8ICYSz+5Ly03FERc5KcF+xOWPh2RwXEPsFLD
         dgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqc5lmm+5oYMOaYd0tE1nVQ0yGX9KJB8iF3fNQ8KkOc81FODRZR0N2D2++A/gf3fc+Mtx4bi3x2vrM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwVm2QNoDfyrWKwHFc22qitGIsQFp4FPXDvW4JrcoODZ8gsR5/U
	u6BJXvxDKtc4bOxtOeDtIg4zYfh+SwM6EaYjCu++p9bLjZZjUdGBQNCr415ek7HYm9BtY6n+Use
	tCUR+9R6CT3tW3ppi3cS0U73Dc38WuGbqP7I0unsJ8Z7c+Ed+gtLTwaXhf3Xuq3EqXt2Yjg==
X-Gm-Gg: AY/fxX7ySGmaTBbQZPuD9BO2nOrqEJFmPMN2TvmA5YkE3+emZHMjAwwEJEHzhab47nK
	HGLGY0e9c+Y75XrQYOfTs/TBacHpu683M+atZ7jZIukqNbK3+Ijj/Dd9DhBGetwXq0ZIBnZhqSo
	qGJFfcSbT9gRVcYLkVBbBtYtM/b/XEL0w+4Ya+rCrfOhVA+ybp0QIt9Uk7AxgDR1geAV2OKoA3s
	/LyGt7X1awqlSqKHr9Xbh9+QMNarfCZqxEMRd2lCP1hc2IaYG061m2lKLhmOrTob8G4DZs4L+dc
	RNKi1ePYsW6tyoQypCCAu0KTBZ86txNdXqpu5z4n/A81n2cqQ3m02hp/ftWxWxxY23I/55vdhoU
	W6Ne9l/C0w4fCpfTk51PomLrNn2Zi1TdUtLf9+X6sAJmww3zrUxJbhDiacM0=
X-Received: by 2002:a17:907:9723:b0:b87:fc5:40ba with SMTP id a640c23a62f3a-b870fc61ea2mr392030366b.20.1768222484806;
        Mon, 12 Jan 2026 04:54:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTp5OSOsuyPTMRe4k38M6nE4/+Im8kgtNw0qudOBH1k9hgAUwyjKyKRD7tIQGL1L74hJziAQ==
X-Received: by 2002:a17:907:9723:b0:b87:fc5:40ba with SMTP id a640c23a62f3a-b870fc61ea2mr392025666b.20.1768222484256;
        Mon, 12 Jan 2026 04:54:44 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:43 -0800 (PST)
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
Subject: [RFC PATCH 1/5] net: make configs NF_LOG_{ARP,IPV4,IPV6} transitional
Date: Mon, 12 Jan 2026 13:54:27 +0100
Message-ID: <20260112125432.61218-2-lukas.bulwahn@redhat.com>
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
X-Mimecast-MFC-PROC-ID: HXuqzWr1F0wDKk5JAEy704aLOgDoX5iXV0Wf4eDEgzo_1768222485
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit db3187ae21bb ("netfilter: nf_log_ipv4: rename to nf_log_syslog"),
commit f5466caab9a8 ("netfilter: nf_log_ipv6: merge with nf_log_syslog")
and commit f11d61e7957d ("netfilter: nf_log_arp: merge with nf_log_syslog")
deprecate the config options NF_LOG_ARP, NF_LOG_IPV4, and NF_LOG_IPV6 in
March 2021. Its corresponding functionality is provided by enabling the
config option NF_LOG_SYSLOG instead. To allow older kernel configuration to
still function, the deprecated config options are not removed but select
the new config option.

With the recent addition of the transitional attribute for config options
in commit f9afce4f32e9 ("kconfig: Add transitional symbol attribute for
migration support"), deprecated config options can be marked transitional,
and new options can be set by defaulting to the deprecated option.

So, turn NF_LOG_ARP, NF_LOG_IPV4, and NF_LOG_IPV6 into transitional config
options.

Note that transitional config options cannot have any dependencies, so the
config definitions are moved to the end of the net/Kconfig file to have no
implicit dependencies.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 net/Kconfig                | 21 +++++++++++++++++++++
 net/ipv4/netfilter/Kconfig | 16 ----------------
 net/ipv6/netfilter/Kconfig |  8 --------
 net/netfilter/Kconfig      |  1 +
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/net/Kconfig b/net/Kconfig
index 62266eaf0e95..5bb1b98e8023 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -544,3 +544,24 @@ config NET_TEST
 	  If unsure, say N.
 
 endif   # if NET
+
+config NF_LOG_ARP
+	tristate
+	transitional
+	help
+	  This is a backwards-compat option for the user's convenience
+	  (e.g. when running oldconfig) to transition to NF_LOG_SYSLOG.
+
+config NF_LOG_IPV4
+	tristate
+	transitional
+	help
+	  This is a backwards-compat option for the user's convenience
+	  (e.g. when running oldconfig) to transition to NF_LOG_SYSLOG.
+
+config NF_LOG_IPV6
+	tristate
+	transitional
+	help
+	  This is a backwards-compat option for the user's convenience
+	  (e.g. when running oldconfig) to transition to NF_LOG_SYSLOG.
diff --git a/net/ipv4/netfilter/Kconfig b/net/ipv4/netfilter/Kconfig
index 7dc9772fe2d8..dfe29cedcc2c 100644
--- a/net/ipv4/netfilter/Kconfig
+++ b/net/ipv4/netfilter/Kconfig
@@ -76,22 +76,6 @@ config NF_DUP_IPV4
 	  This option enables the nf_dup_ipv4 core, which duplicates an IPv4
 	  packet to be rerouted to another destination.
 
-config NF_LOG_ARP
-	tristate "ARP packet logging"
-	default m if NETFILTER_ADVANCED=n
-	select NF_LOG_SYSLOG
-	help
-	This is a backwards-compat option for the user's convenience
-	(e.g. when running oldconfig). It selects CONFIG_NF_LOG_SYSLOG.
-
-config NF_LOG_IPV4
-	tristate "IPv4 packet logging"
-	default m if NETFILTER_ADVANCED=n
-	select NF_LOG_SYSLOG
-	help
-	This is a backwards-compat option for the user's convenience
-	(e.g. when running oldconfig). It selects CONFIG_NF_LOG_SYSLOG.
-
 config NF_REJECT_IPV4
 	tristate "IPv4 packet rejection"
 	default m if NETFILTER_ADVANCED=n
diff --git a/net/ipv6/netfilter/Kconfig b/net/ipv6/netfilter/Kconfig
index 81daf82ddc2d..60cf6269523c 100644
--- a/net/ipv6/netfilter/Kconfig
+++ b/net/ipv6/netfilter/Kconfig
@@ -69,14 +69,6 @@ config NF_REJECT_IPV6
 	tristate "IPv6 packet rejection"
 	default m if NETFILTER_ADVANCED=n
 
-config NF_LOG_IPV6
-	tristate "IPv6 packet logging"
-	default m if NETFILTER_ADVANCED=n
-	select NF_LOG_SYSLOG
-	help
-	  This is a backwards-compat option for the user's convenience
-	  (e.g. when running oldconfig). It selects CONFIG_NF_LOG_SYSLOG.
-
 config IP6_NF_IPTABLES
 	tristate "IP6 tables support (required for filtering)"
 	depends on INET && IPV6
diff --git a/net/netfilter/Kconfig b/net/netfilter/Kconfig
index 6cdc994fdc8a..c7f9fcaf6028 100644
--- a/net/netfilter/Kconfig
+++ b/net/netfilter/Kconfig
@@ -98,6 +98,7 @@ config NF_CONNTRACK
 config NF_LOG_SYSLOG
 	tristate "Syslog packet logging"
 	default m if NETFILTER_ADVANCED=n
+	default NF_LOG_ARP || NF_LOG_IPV4 || NF_LOG_IPV6
 	help
 	  This option enable support for packet logging via syslog.
 	  It supports IPv4, IPV6, ARP and common transport protocols such
-- 
2.52.0

