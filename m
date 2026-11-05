Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872933;
	b=ANWA2wE59+SLhckTpeWJvpojcnWdbR5c7M58GsQuTpyk61J6nI/9imU9ILjGLbFX5Os0
	 JnF1DB8xV63hS3pk5UK2gfI2QdZ9pnCOVhrbtfr09M6+2puVzAik+RwWEX696CpJZwnGZ
	 6Kpl8aBfomrcpjV6MqbXXJtaXtVT+VtlTYZ6CtnSeVzlWaxZ2b7tK1qMq6Q7KsPUYQUOo
	 P2oOweXovdP/fr8dJh3vYtfD3LT6fGC1VRKzkJjnLMHUYKQzQZvnMxRvpJVOuj9yrhBNT
	 CCnO6TF/rQpBbmUJdgIspzhbXwwujtvYg2gxMlHIHDaydoSLEKn/mpCleTCHN3hODbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872933;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=ACQdfOVF8hlwrXWtgXGqMClGZW8NCPYsCbVmdH232kLrNtDrgeAHlagIVimWnFj0xRqY
	 NrskqFBTHCJ5GLY4uBxMpxohN061MHYgHdO4WqC8d8EvMdZnQ0Ttg7tAWa/tVB2cn4G/F
	 om/a69O1RrhshbSiFKNflFhlmFual9hcDzI82BdUAhxU40iyIt0L0gSEDY03KIjOGaQn5
	 LFKa8EIkrMFMkYN+pycB1O91+9i6ok/IgAsVM50Z6bxvI8POVpptSMaS0wiyOYL1lItqu
	 rFZ2ftpVtiWKPYZD+NLRddfWrE0xTI5QybFc4JVEc9jmFKoDsnrcAN+Y95XcQ8AvmUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F9C606A337
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 10:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F9C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365f9a04c5so23587941cf.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 02:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872932; x=1794477732;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=HJJlGbRDSxT1Mg7+YqDU+AI3MbFeV1fxVlIzmfXd5GyHeBaeVJzLQQHACnPfSZUnl2
         HzGSoiSf2zrYPAWxD6gNH9jZeF/UDit/nwaOckscjNUqgssY+nOLkFVLnexWiKPO2ve3
         MolLAPvQpaewjw+k83Q+tNqx8JeikFBHEyxHLKYpjcLrGCWrTzfy3swFd9AhNQjqocgq
         G/0BJMhF0uS6E2Du1eUoCtTGBlfa3Dz9Z35j7ZJCXyHu8Ez+55HrKqFqstfEyu89MZPX
         oFQnvl0zjOBG3xxz7RahJh3L6EQs2v7BdsbknF6G6j7iL3OCMAdMMHINXUDWIenii+Sw
         6hVA==
X-Forwarded-Encrypted: i=1; AKwUvBx2r/ZYA/AU7sXqzaY553d3xvV8w1lHxg4GFchpombwW4WgccPUTj8iEMkh7SG9j29R11Une9VmtKrx@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9791+YOKc9Y0j9xHC8gE16iCR41BH+UNou8CRWK2FFR+AOxzM0
	CNWKh5jlYi+4Nw7e+4k40m+8FLpFjKeyTLCZP5p+L1cSfpCfXkidEFquxFRPJxZAnHw=
X-Gm-Gg: AYBFou1wj6ayyqTojvBycZPcOKQXo7wZ88YA/amH7oxBDzIIVLXpAjsidD+hkzAmxfI
	qJxWv4CmThpMM29HlHw8fUhdOJf9SNcx6DXM9qGxg6bGCDB98pgjl4FmAXMq9gjrWvR5x//HSTX
	QoWIM66tJ9yskMS9ktkGITQJGs5mHy4SIgWenX0rUyoO76e1Jq9xGLE8VRVi1bRrDqZKL5gBeVZ
	Xd3GmmOk6kNkehEz3IixOhZX7atidL6om5nax3Vk3RYS+FdMUlMCZ3tTMiAK586wCO3SukgoUyT
	aJgpZaj5O7T5KaXlS8CI2TGEbGdJvlCBm1on5yRIVCm0t35K9+pgPFZVYL6y4rs3ap7YBZc6F8p
	RvkXnlZqxz4XQYvpZ3UNOSxSTmU5TNfOd9IfOE2lZl+r2WVFZFZvst5147qaeP2oT8/6hPYhqg5
	YrQop9kMJtFV328N5Zg5hRTGW4erWLMgWDTHw4sdmktx/6lv5bhIwQAqD/Ji74o1ZihbVOFdPCQ
	mYIYTFu4Sj7BgUwcwZdo4CkUvD6AD2LXz0Nv29QTabNcQX2ncbBDzDshe9Z3TBdcmCpxF9b4KpF
	G8/SRvRfedRY7pAPKxfQpRk8x8l9hVGUGR+nLyW01GytIltNewBw3+jUZ0rdZwsHoKQYUw==
X-Received: by 2002:a05:622a:5793:b0:535:b21:c997 with SMTP id d75a77b69052e-542b3a79103mr305420931cf.8.1793872932159;
        Thu, 05 Nov 2026 02:02:12 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e7007b8sm43441816d6.31.2026.11.05.02.02.11
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:02:11 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93cc1ab5f6cso198474485a.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 02:02:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxFO8a32eOq53RJPNXSAU1aiJaDWFhh6fHIV0rbbGgsTxj9Lhf1hVvJpC8FjpCCVt8Y68eW3LXt6FXf@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
