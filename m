Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783864;
	b=kNHyMV923zUVQ4zHrvs2LWfCbEJgmiLVGAiy5kkx+XRnqENJ3eIk/WRn2m2exiGySMEa
	 kzAEASMy5ehfLkBwdumjQNBb7nEpnDcfO8oClANscMMal9XP79fM1PP7IwQoG4fc645z7
	 ykZnVXyicF0IINeTSho98827C+77CwlVn6EUxrsNM3QRHd/Dy0XC+L9+X89ygeQ0zJmfA
	 Ar4IZlFaW+5Odw4Qos/dqT3P3SQMEaZhf0vZgJMfCmugjIKf3XjDl5I0nKq8fvA3RJEGL
	 zbzn7yXc2kIKfuTnvfrJPF0kp3s374IIcVM8UrPOHdq0zvSwPuQAR50vV9IQteANXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783864;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vFLCfIpQzvj87maXuJncKjZMHxfbMjkVEErOwSrEMzQ=;
	b=2s5QGPs/OnIV6CFNH4LM6BaQQ3weFcv2bm67NnYWluLin3ppxN6ubpRCF3GrdNja9UH4
	 xvygIUZ8Lgowi0w1ZgADz7FW5NYMWqFV2ZEWsQ1RWjsUKUZycseSUc5ZktYreZ20rJIBU
	 Vg0kfE8Gkba6FPpfpCnZEsNUhXs8VnKqJubLWCDdKlca1LXJRs/3GM3HJB8T0VMfTyp0P
	 0UzzT+BNNKGm7V2AxlUWf6AqCtyhou/qyZ0lOR5SyUdR39Z2JOd5tqGWRLx7CUpv5EeZ5
	 JmgLoGekLg/bBnCdsdt6Mm0xQL/YEege6TD6jUHDX57Eqn+3BWAEGAgiw8K3NdKyaFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkGIp68v;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0468E606D810
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0468E606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkGIp68v
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33B61600CB;
	Wed,  4 Nov 2026 09:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9461A1F000C1;
	Wed,  4 Nov 2026 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783862;
	bh=vFLCfIpQzvj87maXuJncKjZMHxfbMjkVEErOwSrEMzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AkGIp68vobiZwB2XixXdCJHgtF8bS2InhigVuwsdqp6n5/W+M82eXJQmgMDIXncGQ
	 ZsgLev6upKoTph4wRGMw/6Rt8tdd4yiEe0QTNTPemQ626tgZDkM1GcZGQlIINcGmX1
	 rweyg/M+elK322suBIlSSUF7Ca/phJp24NGzpraEYkCKjrptZL+chTq0rR5ps9q2f2
	 buSjg3t9Zzbjt9a55NJ2t3tMIsF7dtK6fdeAh04poa02hll2Rco50kbc8I+oEfsxAS
	 NzUPxVvIxDSaOzz7ERaAm3QpoNHvfOUNEKEQothQH0rTaYd4IAl0SGRh52pJdJDENe
	 eaiECSjcPGAaQ==
Date: Wed, 4 Nov 2026 10:17:28 +0100
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados <joel.granados@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
	linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	netdev@vger.kernel.org, ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
	coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
	sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, 
	Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of
 config space accesses
Message-ID: <20261104-beugt-kapern-geehrt-19e2e2dd58f6@brauner>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
 <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>

On Mon, Nov 02, 2026 at 09:58:51AM -0800, Linus Torvalds wrote:
> I think this would actually be better with rw_verify_area() just
> checking a per-file maxbytes.
>
> We already have that logic for lseek and friends - using that fairly
> hacky combination of s_maxbytes and !unsigned_offsets().
>
> We should combine s_maxbytes and unsigned_offsets() at file open time
> into f_maxbytes and check that not just at lseek but in
> rw_verify_area.
>
> And then things like proc_bus_pci could set it's size limit in one single place.

Yeah, I like that.

Hm, maybe we should keep this and the isapnp thing small and do that
change on top.

This also might mean a change in behavior. Because a read past the end
returns 0 for proc_bus_pci and for a regular file past s_maxbytes. So
that would potentially need some more changes.
