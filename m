Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633038;
	b=MjfmB467L3qHTIFX5/jFc3Gv5x0yJlU8Lj8IMVnZ7hrvjW6K2q9Zn4kfrvZFJrvauN+N
	 IOG5pgiJ/Gb2aqptZdsIG4YLWxSf1aLGqnWKhjGAHvUjxdOkN+JWDWBC0ulj2wQSZ4Jyk
	 eldcEG/7Tv+BLcCG29N4Ug4Xq+gyBXOH3BfF7yj9nYGnfFjoWtcGjf98JNraLs+MW+uZ4
	 dzemDEH6fPPvOsVZhGrzeMA6bwWxfiEcB0qa3si+bMrN0Uenolckbn33A8XenfC89Q9jc
	 8fGW7Hf4qJz/KGLFS65aBeeTMwOTG/Qy50pAUYhDI5rfmedZfMCgBgckWkGYRDZwb+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633038;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Received:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=uEqaClazRJnTsShq1vBrZThkV8Ug5LupXRrZvH3pubU=;
	b=QGhlAY91uHyI846zCzyHLWKyBkjzDAnifPJI4PpRzreXvKbSzXheTc7LbahytaL/yxwb
	 qABWKPIqJLymcW3Ng1qum2zu/bhKxwLgUwAzann2od0l/8OMxePCt1jgigoFM/n61L9VW
	 Q2SE1VT9+I80ZyLuTOJ82eIkbmFa1WIw72AdlQmiSN1+SZ0EJqwAkQLLhTmh0XszNPIcD
	 RozVLW25ZL3OH3VXS6Jkod0/TvfsdNWRomwgiqE/938JBoS/lOsEw4hfeeYnQX8TLCvwt
	 12twCYVsecnscscarrFHmjYsYMR0utrEVAK9rOd6EJa20cLsknR6WIg1AG+7+XUxdww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I6l4/tba";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9BF6098082
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 15:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9BF6098082
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6l4/tba
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3208443C38;
	Mon,  2 Nov 2026 15:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A1A1F00A1D;
	Mon,  2 Nov 2026 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633037;
	bh=uEqaClazRJnTsShq1vBrZThkV8Ug5LupXRrZvH3pubU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=I6l4/tbaekcm4F5Uy2sM5lYNZJehob3zbilnEvdVd5Be7BHLSA58cOrhPrILPdFvq
	 VYhCXzN+7v7yzkwvPgGyx14entsyEm+617RN6ONGE//eK8k+1BetRrKVHulJ5QbSin
	 PhS8HfUZqzzeMZUZO/v6APmD3sn4yaMgG66Qsqn8sOS9bND8zFW5xc3DAvH+pJN+zW
	 2O5TNMh5qcv6DV4Yetx+J9g4v/mnh/idqce0ZMwvwkWvvLBPw7dNas6Ir9cn/TKgi3
	 cPIc+u7eIO45sBIcX4Oa8V6/wXDS2qubRfgYQs1GfGIeyTgMlWMeauo9Hh77UxYwL6
	 FfVTg57cgsBVg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4DA53F4006D;
	Mon,  2 Nov 2026 10:23:55 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 02 Nov 2026 10:23:55 -0500
X-ME-Sender: <xms:C6voavPgQSRhi6XwAzM8RnPtl2Qk0fRj95s09_7pjCvBkgc9wCgEZQ>
    <xme:C6voakztuZUoJrF-uTAxl2B72x3pmfwEKg-LcE13JEST5qccjmIjzKvqrpEWmzfMg
    -nHWFjmTR6858SSLl1zCNNaUAFoAnJNEx_iFa19V0Qt32rVtZen6CU>
X-ME-Proxy-Cause: dmFkZTF+ugG07b1xzJ9p0xcEFxqeAUuLkm+cBz6ii1+M2o4G6r8HqTUbbTFu18jUFSJc51
    Uj/WAYx1vLl1HSE3ylvEypL7jKJPv1KgZWPB2jf1fZVCtbPTSv1quZFsQjIyJhe9070QIh
    uQLf2wtG4yD+ojXnVZ3slOSBiSDghElaqTK7IeYJyToLF92DkQAYc/RGRRPOyD8hBeRAvE
    Nch4lTm0R3j1fupNVliv+Zb3ueLjvcNJfLsUEyktNZuL98xLp9t29seWsvXUNWHVoJ4uvh
    slBVaqCA11v/MsN/MRHGG05E/DWbmBLvDFJPHdsId2elsukPHwuZGosb7WcPszwpbfZZgV
    bm2FrNuJvmDOIFxayRrMo3/bGXJGRqqKBPvBIaAv1rXkENYn4zSvEA5QOidA5pB3XUhmos
    x08vQ9jzlrTeM9JnMvw3se+lrV299CFmE+fTg+hlbCRXvAl6sZE79B8vu6VSR9XtNh0jVy
    C4+hYe89om3miNRS4TpzQvyb77peufEKiolSIU0wmyCGRwtb2Us1G/qCaXB0fxyzIy79cY
    1kg6qGRDh7uw8Gww/mv7TrEgW8mpkzBuVLXohTCxaKYorV+OhEcRntGnKGm/9Exa96NKy3
    AMQrlyXBmDZmT3LrcryBxr6Vx6LQ+RBaOIY9+Czn08jGf4XpaPjwaHDoTtxw
X-ME-Proxy: <xmx:C6voanx9pQkwlSkK78xJaos_d5jwrX3PPHLb_TLVG8fs-X1Spep8qA>
    <xmx:C6voalKVyQAGVPcO-wGv3krzxEi_6FtQAeAVqBnSiS8ylmXpqCdlxQ>
    <xmx:C6voajxgXNF0PnlEcauvcL5M9jsWsivItl9e9M8ymKswT8wDOTEnxg>
    <xmx:C6voaiqnbxtboTm78N0amXUEhxn5ytMWswtAcUdzERqqQMeM4JMAbw>
    <xmx:C6voapU24fdZKXD-sUGTpbuIUcSP2EFmKemoyPTf_TL11WFoX74F0nG2>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 15863782738; Mon,  2 Nov 2026 10:23:55 -0500 (EST)
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
X-ThreadId: ArOOpyqnvtx-
Date: Mon, 02 Nov 2026 10:23:34 -0500
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
Message-Id: <58f6bc57-d6e2-446f-932a-8104b73cb654@app.fastmail.com>
In-Reply-To: <20261102-work-procfs-fs-v1-3-d09a996317b3@kernel.org>
References: <20261102-work-procfs-fs-v1-0-d09a996317b3@kernel.org>
 <20261102-work-procfs-fs-v1-3-d09a996317b3@kernel.org>
Subject: Re: [PATCH RFC 03/27] lockd: let procfs copy in writes to nlm_end_grace
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Nov 2, 2026, at 10:07 AM, Christian Brauner wrote:
> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry. simple_transaction_get() was only used to get a copy
> of what was written, so look at procfs' copy instead and drop the
> transaction. A second write to the same file doesn't fail with -EBUSY
> anymore. Writes larger than PAGE_SIZE - 1 bytes fail with -EINVAL from
> procfs instead of -EFBIG from simple_transaction_get(), which refused a
> few bytes less.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Acked-by: Chuck Lever <cel@kernel.org>


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
