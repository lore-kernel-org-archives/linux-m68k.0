Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654077;
	b=YZGpQmBKIo6+Zjz2+5QniG+zK9GmT8yD4lj/SAyV3BW2vKxlY0ogsEgZCHX5bcFjq5We
	 KCoCHbJAMGPbXlqcImwVold1meqfMZpwNwN1b/EQgfXWMz+K6Z9tUlCG9sMqLY5MfakMZ
	 x9YXUX1fFgtimox0PH4xCMVATrYIdX2z6fdLExcj4IARyfGrRjvFhFw8h4pBJsOMznjT7
	 uaXW+HmB6kaXViTPWJfC+f+S6iii4VGz83wZVQXsdgxHgvF8u95RQAliPKMwjDBYSXZod
	 +uAdHtgXQRXPrD4XrEOGrfzfOkWmy86MdyGTF3jAZgUgmOb8LAjsU8fnVR8JzaZvCzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654077;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Received:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=e/MGsEabL/7GG396Jx8SjaCfwMIwyJ2tMCUpq+3DLDI=;
	b=CyKRkn0r0GNfB/5UfQrd0AzBG+jiHLSbSK8e3kntl9CTc0xmhiKU/uLe8G/ezoDcQFeE
	 Fv/9i8tO5z8ilQm6IqV7NseSJZkHujsGdkPyHeuF0KqxrnTItUwWRg0UyfY3GXhxtMcwK
	 IX7V81Up/Dt9IiLNkGmZrIBmz+kmWbkhRolFwya/rRwyVdPZUm/pIQeN3W5VpIU6K35mY
	 iZKMNcZQWAfzUHTCBjLPiITvGQtBxy/94nsaPjngh/ovePQDIfZ2FMg964EryL/BFQxDr
	 PLa8zuMVs550TC7CSxgPvnTjA5OGF1oTE6Vc3Fiy/rJsSgJxlW6EHXRLFDOuPCzZrCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhto4Q7I;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17EF606D826
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 21:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17EF606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhto4Q7I
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EDF343902;
	Mon,  2 Nov 2026 21:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C176D1F00A1D;
	Mon,  2 Nov 2026 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793654076;
	bh=e/MGsEabL/7GG396Jx8SjaCfwMIwyJ2tMCUpq+3DLDI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jhto4Q7I5ebcc5MAm6sH/pHKRFdCgRbQR8Fl2+sLkmyywtaBuxW0OrmAy072AXrP7
	 neEtlQY1pHB9h9IY5VKXyMTm9hAxvyM+0CydcHI4zbMaODZ/uMSO3wm6XKSdUXw2i1
	 zw1kWSaAI5GRn/p5hrqeLkoRrYln9t7Vva5aU0nqaFNoE3NxvXQIOkLZ0nPblQCZnu
	 lj0gUvZGwF2dKABRzhIzD6Z4H214iL8Pty+VmUiC/RJqkJL53MhT/faeWoYgOhsRM/
	 5ZXDAC77RZiX0M3bldPrCNSYAivbooBumK3IGE/4nnV4JAm4k7cNtwuVJfO0h02UT4
	 YjmsvJgQpUiDA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 26958F4006B;
	Mon,  2 Nov 2026 16:14:34 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 02 Nov 2026 16:14:34 -0500
X-ME-Sender: <xms:Ov3oaudaRP85NzNgvo9gkP-MXfbogSw56-7TMRTbPKxIonQDu3IxHQ>
    <xme:Ov3oajASSRT1bTVfE6Yfylz-Q2cb5WzhItUIpzyOnYi4Ho9AOkdZT6HjOaX20rb4D
    9taQ97lq5DfA_nhyUWeMZ_W1taGbwO-fS7RiMfZ9u2zRLst3-ycp9NX>
X-ME-Proxy-Cause: dmFkZTEwFlNdOZMJt/6ERsMJpfliFwApaNUQtGyzrNgUVhL+xr6t4hflHpnCpvlDcd34OL
    tsnnvmlp46QcBNUANprPsj0jIeIkFlAHqmtQZLa2Sf8hNpQ9wBRFf1oo7j5UmVKMmxUPoD
    CAYsZ+irDyVCdEsc2qGBd+J6vgHB5jfhOit/H7yfEU9O3BgxuDkP6BIpzFQICmtidThPiQ
    wQ5iTjbCuW/m/r0nOijWyl7wYDNa5di+BmhLTsIvAVvDZmQjQEiKQbgS7OaGcQ8IrAe2iJ
    dzOrAPUicjvABQdhm6+s8X7yR3H/OnFcIOzSI3sa7nr++6wlo9Nr7XGUu9npauH3EjdnZB
    d8SiICjs57Bl5kCrWEBHfpiNyDf0VcOFdp1B4zP1lS/QTex+fDbly0ZmI6Oy2ConL4lGxh
    /glhXDiohYMGBeqhE1OFWto0WwZtKmCLBCeSZfL9MCPfURDGaHHisnCZY6kvsOFDvhaCor
    VZqgtiO/SBK/Y5QgrCdW3HFV3LwJ8YmbXP/DugUPUadgGyQm7Xhur0+oUAzHb6By+3knGi
    7OFiG2suqU+MsawnGTt3KtMcmomuas+uDRlvRDytGDwdPSUnJzYsk2KECbsMV0y2fBTHk5
    K+qTiHGAHJZkj+8vu51m+NPaw7fmZCNvqOYyO7NAnNI1SzeRX6rDMtnriOEQ
X-ME-Proxy: <xmx:Ov3oajAjXaAo0MCg-5mOh1kpmlpYdD2YfnidScMjdG05laxXGCBcug>
    <xmx:Ov3oavbaygWZIZ9DvVH6jb71mOGY1Ado5jGzZJVcQaL4VUVNzfnyLQ>
    <xmx:Ov3oahBfqIJHdV5qBhjnVnio35nQ6hlhJrYFiJZOCEftQWgDSSVQhQ>
    <xmx:Ov3oam6fLaNBtJqW2gtTD_ISnxMIg_eBjR3o4IKYsrM5dijacJsK8g>
    <xmx:Ov3oaokDgUdqdaNtT5fJJp84D48qBuDsZWPWAns4MbOuSRRfIzDAfjj->
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E5D1F78273B; Mon,  2 Nov 2026 16:14:33 -0500 (EST)
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
X-ThreadId: AnCeav_jaY2o
Date: Mon, 02 Nov 2026 16:14:13 -0500
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
Message-Id: <f29a6aca-edda-465d-b6ab-9c7a5d7cddad@app.fastmail.com>
In-Reply-To: <20261102-work-procfs-fs-v1-5-d09a996317b3@kernel.org>
References: <20261102-work-procfs-fs-v1-0-d09a996317b3@kernel.org>
 <20261102-work-procfs-fs-v1-5-d09a996317b3@kernel.org>
Subject: Re: [PATCH RFC 05/27] nfsd: factor out setting up the exports seq_file
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Nov 2, 2026, at 10:07 AM, Christian Brauner wrote:
> Move setting up ->private and taking the reference to the network
> namespace into exports_net_init() and dropping it into
> exports_net_put(). The procfs file needs them without the seq_open()
> and seq_release() around them.
>
> No functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Acked-by: Chuck Lever <cel@kernel.org>

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
