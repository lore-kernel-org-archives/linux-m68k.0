Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642354;
	b=4SPUKVQ6Yoo2i/6mB9k8LSIc8Z/tFfhMRidWf6YaxyID3Qn1tyRO0nkycmcusK/e8oXV
	 XVQIKKU3daq2KsS6UYQq9ALEGpj2PumPPTVGziKl+OYPEa3RxXiAfFKVQecQwsFugnMou
	 7USs1f53kpWS+bJhi4gPC7y3N4WIiMpHmPSdbOJopwYtuI8p0hj0hA9FFxsKm2IcsOFFe
	 tgkJVGtCXfNsvhjbV1nyX6QojfpATjmPVuMWx0E7uZ5L/qayrSRGJjI0nSujMa+E9J/gw
	 gW6od9BbtdUysnbTViCfg9phxmBtZM6Wqn4Pap5vznuPbAqaPeycIVak0FxtTwR+4CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=Ra5Ucc0bDSNMAH1xDp/Lx3G6H+wRCNmKz7W7E/InzHjcJWfwZIJJCWwKD8HzaFCPE7nX
	 zE1ZDjtNcdYCIYg9dyO/YgUUb10vB8cxVbY3kS+KskL5NirUZhtumO6lX5J+nQi1h+bOU
	 c5q/qc5/xDZTa+iR2/08uHxvMecalrO1l82iz5S7PnKKZF988KyIIC4JW+z3CACM3cp/y
	 aeFjiJb9cG4BZv8yAFUuHN9uF7ee6KTzCz0vvFl6vY5k80fnjBt6lfnSPhWDjHYHbvDgR
	 1rqa+OWSJswauBYcL6eIj0MalfmGcZ5XNuqXdugZ9dok6CDQip4rgA+7joXj0Pknt3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JaFqUzIg;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE66606A5A1
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 17:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE66606A5A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JaFqUzIg
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c169ae1cb26so692093766b.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Nov 2026 09:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642352; x=1794247152; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=JaFqUzIgXO9W+0c0NjyUsG7D6Bhvbs2jTen5qbXskXCJ22TZNUH76BibD/Sn2QjWVx
         fB5pIoH9a0nXZkzkFEUtAbCBngeqlmKxBnSnLL2OqnRQO+6Q4OU4nBTK8nc0yvqINakU
         5NVd6lBjFkZB+w2UI1JVJWkle+ag751iNE3lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642352; x=1794247152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=IaEXaeCeytg9AEwDTA0VUPcCL2ArlVFTVf42+2U5YiTQSqjfnHO0Xsp0h3qVmoXLrS
         fupQJKbRvWKZ88lZZK2fRheN5gN2FUHIVEHz/h2HpokQqb51noB49tI4oYviENTZygph
         xr9usAr6yUgXFbWxhM00fsgzPFGpEk5Z6tP/w2EhBa++vRv9GnbLqEObwK72vyFAxABC
         MVSX6bmZ3ASXBmXrz8RNAH7WyBN4qI+90zEOkLU3FxW2QaDCk5FeExe3HRTErPAwWTuX
         x+f8tj0ZDN/ffkurbeumry1CSAKus8+IQFLuo3ceJZnJV5kENLtmL2qengT98P3Dibdo
         Msnw==
X-Forwarded-Encrypted: i=1; AKwUvBworIPn7fwUVdHZe3nDxRbxg3L09F6D/g4Z6sRlKLGURNovouF3IctqrdrXL6HebEjpAxJPSZ5b36xp@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYJcV2bwCoXE1iuVVQ51oZ7f0G2ckIRUR1ulrULN3X4Prp/X8g46
	gkv3gcMaTwrMkGoxO168+XVIhfRoMVdNwlWFWiituFg0eloyR0HNHbCUq6PQe+QUhtipB/KwS76
	nHFs9zBI=
X-Gm-Gg: AYBFou2KdZy/gmB6YDAMTWjHZGKCjpiPibsPVZbb4Dwaut87ldYJGr9vUuBSDohIe99
	FEJjUr7nk8M3a/fOjZbHbdMXjdqCAMsIGI0Qk8O/nC0o7Gb2Jz38h5mP07c6fa3vOaI3qBZ9ye/
	4cFzniowVNlMoY+/g5MLzTvo9OAdLJkZvhgjc75XuvYMNeDj3v6pZn6RDm/yudaNr8h8GLM6yv6
	n9jXlvWeUVWP6n1Ai/SSRTHgnn/6lvB2LPU+7Vk+KAO9jk7+9SCG11U1dgtROM+mpvdXxstz1VP
	TGq5rYjRXR1qooM0NGOhI5jphbNbi+7FjqR+lP8fHVo7FJ0SOez/EP+m4vP7IEE4H9pHkVEeBXl
	E4xUmMb00D5Px5TiFcvDf0FWuT6PXeshoxDtg5EcczvndPMK7fUkEzu3aYR4EtL4k/DgGSleCeO
	SgRLpMa0VKyi51kBbfm/4mQ/exsPjW3epUmlYBMC2cREC4QRQ1dsBDNwUwsNpXPr4tbwJU7qiiW
	o+20Xk0bVlXZQJ85nk1A9sNULdZkqjdqnlMA+LF/OVeWswx6dozq4l2HAlpQ9z/Wp8DF/t7GgHI
	WXFOG9GlI6rI4+0VLMdABASxy+AVkAo6FLDkrXo2r42zPR4SMe6r3gbMVLIsivptYEt3boe9DMy
	8Yg==
X-Received: by 2002:a17:907:9615:b0:c21:5cd6:3e49 with SMTP id a640c23a62f3a-c4ca7a697a3mr920817566b.9.1793642351772;
        Mon, 02 Nov 2026 09:59:11 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebd3a2desm12793266b.10.2026.11.02.09.59.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:59:11 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c169ae1cb26so692085566b.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Nov 2026 09:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByNGePxXI/YG3ci3Ich7TIDKkYceSaiC1XuGZ+QTYhSooOrMpF+coO+6PGqt4dfVaLOsK+aCkfy2IU0@lists.linux-m68k.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
