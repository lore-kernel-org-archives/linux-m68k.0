Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823157;
	b=o3ycxMakapBkKWvhXny1MM+PzhFvXH18Kiw9a5Hj5JsN8GlCVaBOPRx9jnI5jHJKV0ef
	 G5OT8PTN2RstvAvmLhKprheI9sxbg6rCZwN3//xDIo/2e1QVAV1ZfsJQdlgm12kyoPilI
	 4xjiA9tXTf54v18AeFKQjO9R8ubyvm/vp81mfVZphhAvGPbYmGG0ewZD7p732qfwclQre
	 x5x+QAvmhnMfunA5Q37KTaQIGtq5EUYb0hHv4Yn+4s3YXvWvXNWvkSP+y9FvBM6PZTODG
	 OQDF0+5cLJBX/gQK+ICELFKVRI3NB/qkkrlPejwpNYrDrUbk+SZGxmutSP5bDOAqpUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=d1RddU77pMXDptQTae4azTfo8RpPVYTFYim4nvxLAHw9auSfhiSQ1lCQSrL+9mF9YpDI
	 YKkbR/HNODVIAk1pnP8n+WpuwiJEqqOTpq/KfXDn1Q+B4L21P+0es6PtAbzEXSqf6iqoj
	 8v/BPlMy3cDjuunx7uKMsj/iacU9Zw6GKzaYc6AsaH/9g7y1SAh+ICad9/5C69TxYlgNv
	 68UgdXo/V+QZxIzZmoB2Vks4CNAgdoK2gqrfBo4Q8yO+DAhwPSSr22R2H8rYztjsC0+h9
	 ulKUemCM4OwyJrKOiv/RTXGt8L81zQuaE/vcZjG9m8T8MWqanDZgQBmc254eAOgz/eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HCsmWVWU;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F56080791
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 20:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36F56080791
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HCsmWVWU
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so82669a12.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Nov 2026 12:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793823155; x=1794427955; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=HCsmWVWUtPMQhhxLDKSpV3J794DvGvRF7pbicEJyTq/98NVaa4DVMlIXAbVVUENRBV
         gZiItgtQ/PFWMzEoqTJVb5hI+l/CknJVvid6B8Ua3qhxDEm3weNCcRsivlMw+7zDFOaT
         BRXZsPsCyfS3vHhkWlji33yOr/QHWqTpqwrDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823155; x=1794427955;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=dj/h+q69+KRaku7YhJEKHKHBiehMpJB6HNH2FPvGVdBjL9n8PlJPmIDtM/u7eDQ3eA
         ik2OR7YSwBrhYYjKBCXOd+9sHbUYRkka5vpva6UkPGj+/lSlBnFAtkkzRVo7UDs//1eO
         LzeMtp++Dv6cdBHqzi8vbo9OjP90AfLoxZkWWD0ITHBSBnQObp1OoaRxjXQVWOphq9Kj
         EjXRxpRXpzbLpOoU6azhthLAR78Z2GxGtki3BBI2ivFPiGyYUXHg2z5UDUgzGTW49cXg
         1DDK4AkiP0gOu0tOG7ZcjI20Hc+yxltkWU6vlY2fbpzMlb2caY50oiKVj8Nqgy2sQq32
         v7Eg==
X-Forwarded-Encrypted: i=1; AKwUvByelqpa/TRS0vjuZ5k5JntiDYJVdTsWdYPve47fkEmdk4rS0Oe88D4a390UXToP+1hMaFElHY+2iybO@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+fSIpq31zQKki+Ss+IfBd+A257Tj1n2Klf6U5t0f2iBEVb6Fil
	PuvAG32qsqmOaCOJ+76HD9ySfaJvpwhPgaJx7VigJTm8OsAklovshyM4RuvKVuDE7mifFPMgf+0
	femhiKHthBA==
X-Gm-Gg: AYBFou3ebL8KyXq6L9AId7IiKhOJuvOcG5if/tvPu7L4CP7N/InkiH6M3jTgBYAT3Yr
	WkFr3Unug/Xgf6upreuZmEO9rm3VM49jMvcw7fEBzg30ExD9sLM7JGobNfIGiZ2qoYtClWXIf88
	DY8BkcdcKN7dBeusnrZYrEwItIuE6N5Qr2+iY2oP4+9Pmi8hCYmfDD6x+AIW2X656AFXmKfvhG3
	xQ6VdD2KVTGWStF54CfEryQjlkfmv8VAj7eZEJ+u9O1c+ncY6GKaFxOUJM+pKIwuI8PTQW0/8mU
	HWgHLT0m5Om+1XLL3SQFvlhpTOll7THvkJILDLeSUbzHvE2V7fGkGY0oeB5CyrJxEBEjXOdTXDF
	CdroApSRpHwscUueXxp4yeSdG2Kq/+Eobcyq7CcYgMRRaWPMl+TUyVW7HVCaUA9wEFRcaiG0XJC
	HOYWUGCNR687HzxPoqs98LijAShwQAVqdt2ikUEBnMNQMAHEQIQ5QA1QdvkV+ewyqOYoH/jSI/v
	WYk0PW0T/Rfkkm8i1eGvv/gtr4w59WL3q7p46Qm1dSqFe0VTBUTLCKvol+gVnFAh9Knb4dL3Jpy
	emNM6OJ7y4S3hDPDJmAigPmqThK2wDwuDp3p4HBTPP91D/zRTTgnkERF8rp6+AuM6cxgB2gAuGd
	ZKg==
X-Received: by 2002:a05:6402:c9:b0:6b4:12df:8243 with SMTP id 4fb4d7f45d1cf-6b4d468ad29mr9844827a12.20.1793823154862;
        Wed, 04 Nov 2026 12:12:34 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac83d9esm1094169a12.32.2026.11.04.12.12.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:12:34 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so82651a12.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Nov 2026 12:12:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzYZzeeQIN0+InfVF/pGubUQiWD/GW9RcFc2HhXE+DzjXM4DJ2725sBXDy7ueveU+TSGscVTdwwVH3s@lists.linux-m68k.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
