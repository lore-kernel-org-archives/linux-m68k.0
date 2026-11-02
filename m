Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653908;
	b=JexXTIHpMJUV0zo7nen/lWtUHGaTKRq0+jJLxiLnlUCxj8rxtAHyXZHMTyhNWK5wOy1a
	 qzJSEBlxsqmIyJeRTyxTQ+VMYWWimW8MGnEpwiwyiPU3t0oGcqBGHOTOZ5lWQllbAPYls
	 STVfr1+R6XM6hFeDMyVwTw9kw3yfuMxJwY4DTx10WrdzzGsil83vpNncc+tJfD/Mylrwa
	 oMiTU/mWdUMrZBZ1aqLy5jxQGlq6OBxMqt0+OjDf95ceGnsi8oMCV0CkGNP7hYi9cVf2U
	 RbdKLjkVRyzh9O9IM0kQTNN4p+MCK9LNX592G+vM9nqyZzzCO/qJTx42URLIv/0WsCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653908;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Received:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=xxWoHxsw4VPFqHPAqACZbusTmTkHUnFSnkXXJwnJ4WA=;
	b=HJa1eX/sTaPFaVqkIljt3FJtLxUecXbWo0dtecZW0Ba7LnEGdZjpAB1jk44Wx8pEp6FX
	 CbTb1APdLqvDYtYebd69VEy9dJ6r4eAM/IL6fJnjJyz0B2saiBQ78cuEU6qjuD+HiS5KH
	 NUGObtN59aX6tJAjYu0nGR+qnhRLTy0BojjMqWGeXumFR8NlD2ePH88RUft7V37yexSaA
	 czOb/flEXm8g52YQ3nFoAf48q4bf1LzMGo8K2qvzB3pj+VNIsMcj2BCuMtdxcKd8+cT+6
	 EWhYB24cSaCJ3Ui1C+A7+lZ//nSyLRzb1WwJN3MGcJJdtR4kjkMnJTMpGY0fvfpSOSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dytOCAJ8;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA118606D811
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 21:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA118606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dytOCAJ8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C06DB601EF;
	Mon,  2 Nov 2026 21:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B791F00A1C;
	Mon,  2 Nov 2026 21:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793653906;
	bh=xxWoHxsw4VPFqHPAqACZbusTmTkHUnFSnkXXJwnJ4WA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=dytOCAJ80VHiZ1OuHgOm2U1eYLbIsfTF1vQWmQotjAlcYPh3GK76v2x+nXUxkSisM
	 rRSMnxpBhgTKN8qPsqtbMHMR1UcE5DT4mgUuhKJo4qXktvA3N/yVCLaVhqZ4M63hYH
	 QbrscRO/3j+WrNfWqflniFd2/f4mJsHcE8FZW7CXPExB2Ibn6fo+J7vdNxA+QmucPj
	 asTGnwJy3cojByhQ2o4smk8bCPPjZkdrGQJDXaJrz2GO4vpMh3YJ9pqlDgFCK3Aw3b
	 4wFppyIBa3dGdCapF7WeNSk1Sr3UoL9HoLlYvJGsRNCyDrMBD3ag/9W+/du91VH57q
	 5GRjihOJRtTyA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id A6FA8F4006B;
	Mon,  2 Nov 2026 16:11:44 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 02 Nov 2026 16:11:44 -0500
X-ME-Sender: <xms:kPzoaoxuxxTdjPhQc-3C1zahFZ9aLPvFlowSXGC4R9C8GitGRfcHEQ>
    <xme:kPzoanGt2jIbLsy47fOpg3WSZ6PY5cBPEClcODOsbon89QNyNk_IgDaAKQadQr2gv
    uVji238fOMsmLse7Ab600gs9JzJ4DZGzIXqA8TonRFGYfmnT8t3fbcj>
X-ME-Proxy-Cause: dmFkZTE7nCOuYmDhbapfq9wnjcJo8I33hiQgEa8gG2mpUd6SiuGVjxefYxNF6ts7apvhL2
    O5TBTvvYo35j+hcPabsgTVdffpGt9MvK5vyw0ZMRJyC2vP2RybIncEIE31yiniEOHW+BGf
    KJmARPQ+h8rxdMmbqHuWCrc+Rw3W1Pf0ttMp3mPjsGk8H3PuZMLxakWBNCayAXhn4arSzS
    SZT0vmmbKnAjrINdR7jALY8t/GQLDesfw1v5pO7HM0aidEkcoMk/IX3mKuG96bBGSC44od
    6j/8Jj2EeiKpBxuZiOuoARjnD/H7MmHLm4946WLbdldIeKehhGb+AjzJw7psiDGcN84+AT
    fxd1ztnRd84WKFx7SmijybVrXSJKl1AR6Etu7r8JTz1E2IGG2rbVvLkvpR2IBVnXEcQUHC
    r3GDkPNpHJrO1FrRX5A6DIGX8s2wqnE6WbRRhP/2UYux7WzU3qFcGt1leEKU+a12CXazx+
    obllJ0NCoPjY5PVFTCgHM6NA+K8OAWAC3Y3QpVQ0GtrFfYBqHxRpcYNa889BVVJkMXM0Xx
    NfAqx7SCTsESPLk/r6Zjs10FtyBDV2ONG987Ot6HPmAwX9PryQz/c+/GTZobKPftcCgNbF
    dMjgQuUNaOpeJy2SLb+WxTNiYQx6H//DcXk9Eak51jjRY6pefZcEU0xUdZXw
X-ME-Proxy: <xmx:kPzoakX1575s1xPK_eRnHKHwfrJs0dh41R1DNgFe6QjSA1GNvloQig>
    <xmx:kPzoaucrAaHqLBPd5fXUJKW90uwtgM36P2rOCnTrC3gEediQhDxGvg>
    <xmx:kPzoaq1brQHn036GXHRWgb2TJPEUtB4n80avLnuqxkDWgbKvmiH79A>
    <xmx:kPzoakc8_jk9jC4iv-WEqTZu5jnNeZJxZR4JSbSaITEBNtWbgxkbuQ>
    <xmx:kPzoau7BSrFGgoTyo_PA1CYGAey1sR943z5_XGLHZHfJ_ObFFdVmJ7Se>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7098678273B; Mon,  2 Nov 2026 16:11:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AFgPYeWZplpR
Date: Mon, 02 Nov 2026 16:11:23 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Christian Brauner" <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Jann Horn" <jannh@google.com>, "Josef Bacik" <josef@toxicpanda.com>,
 "Chris Mason" <mason@kernel.org>, "Jeff Layton" <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Jonathan Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>,
 "Greg Kroah-Hartman" <gregkh@suse.de>,
 "Joel Granados" <joel.granados@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>,
 linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-s390@vger.kernel.org,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 linux-um@lists.infradead.org, linux-wireless@vger.kernel.org,
 "Linuxppc Dev" <linuxppc-dev@lists.ozlabs.org>, netdev@vger.kernel.org,
 ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org,
 linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 "Takashi Iwai" <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org
Message-Id: <7ee779f9-db3d-4829-bdd8-1d09e3f74c43@app.fastmail.com>
In-Reply-To: <20261102-work-procfs-net-v1-6-982104a4f592@kernel.org>
References: <20261102-work-procfs-net-v1-0-982104a4f592@kernel.org>
 <20261102-work-procfs-net-v1-6-982104a4f592@kernel.org>
Subject: Re: [PATCH RFC 06/11] SUNRPC: let procfs own the seq_file of the cache content
 file
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Nov 2, 2026, at 10:07 AM, Christian Brauner wrote:
> Declare the seq_operations and let procfs open and free the seq_file of
> /proc/net/rpc/<cache>/content. ->proc_open() and ->proc_release() only
> take and drop the module reference and set up ->private now. The
> rpc_pipefs file is unchanged. Reading the procfs file then no longer
> holds up its removal when the network namespace goes away.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Acked-by: Chuck Lever <cel@kernel.org>


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
