Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872921;
	b=gYvAYWgjyp7p8PmFDR1aYDsZoiKFtQ+O47SonnaY5/8LWr2WYBYDczqh6XqAwHzWIbXB
	 SCcNr46bIC0xQqCvkSyv9+m4U+f/NbPH1k/Jd0CL/lSfbuaqyQXytX2813brETXMkLdzq
	 hO4gbWS5b435GBTO+PmblAvIN37k6jCdjba6tSuA/yLtSQRRBwkx7Opwavs3Xvs5osxsS
	 5PP5+7JiflcBNkZhwVgm52XhROrizMNCvlv1YlZZ66H1/8tWZrvcGuFb4vHS3BlU5HoKF
	 NbSew1A3xwLuWG5Do1gCQMiaz/nA6X4l88AdC3R+zfg8IAXKg3wicAUF9oy71xSnvnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872921;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+mKdlgKO27T7zaM0EZirUNSUHhSIV/TKUV4SSUSBbFc=;
	b=CNBjRPfp84cjwSS81FPy6qYHN/voaWUu/DGDt0/Zkc7lAFdoJqjEZ1ar/0opCHNSMjkC
	 6B7voNJqjlmuBs2G245fn+yRK7fMk4nktevxMU3vGA4hKZzcoZGdXXK142cod52A0a1bI
	 OyPacvJXkzCuWcQxK30Fju1A0b8tPQiLKYb2H6pDMwS8fb4osvc4zFjdBxih0N3qI8Uj7
	 Yjqi+RYB9Q0frswGuZAQofkF7SFTZIa9QQOEfoSCZb3ITPJhTQypqo/s0liPwwTLOnyrh
	 6ibhCsNgbWfz6dlk2zzITlCNIVaEYV0rRybX7b5wF8VP018QHH6TDa3wA+oYizu8img==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720C606A326
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 10:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D720C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-85c1135c286so1048608a34.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 02:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872920; x=1794477720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+mKdlgKO27T7zaM0EZirUNSUHhSIV/TKUV4SSUSBbFc=;
        b=ETLI/+eqe0sIAj1VYh9m9sqHYcfOP2bVgy1oGjTRCophILVGy/D5zM9RjdNNohSIC6
         Ug62KWaYzwnM8YoKRWcruhRiQJUi6qrShh4i5S/nVHFia9LX5X5VB4xR+nUISXKFyBQS
         X7FTYWypF11E3q41lQlJyzwsijY9dZzkk6+Nh5X0oMZ5LsETKd9kEOvnZetGZDV0wPau
         jfjYpgrjumShnGVIcxsYP/sTo9DjAZq0XXGPf1RHGTrrf66p6XccxyKhS73zUZ69k28t
         i6+DQwsHwi3H9kXZWuqQHE8AJzWOk5vVFu3uvm69kria0/uvwntsd0cmhqTgtpJfLBqe
         Dnsw==
X-Forwarded-Encrypted: i=1; AKwUvBzaY7kvQUl9JFN/9/W1uzpYnviiP+mRnsYF7dDWAvX/xZVxIW0Wc9/ejF9SmcBzY4GY7TjKOoks/rEB@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8KdblNxSaOIO0bRCPnlAQiGtecPKZv+MdZhN/NHklZcWGOHEQS
	lXfkzCti+JqEV2g/N/7SNzxdWzvodOD2ko37Zzy/mWoNdJex8aYpUsWQNz+wpYa01DI=
X-Gm-Gg: AYBFou3E8KsnwGMF8DjG+tuq8LdB6hJy+oqeQ2GdYx6sqT9DkMUs1KZUcEGwyiljOHx
	eOMlTaJ//6i4hsKWPvGU9+2zGMNU4w6DVmvCV32mm21o3mWBsXt2TKUOdwsoD4HZnZL/BR1V3Fx
	dwSdY1aYKckxFjRTI69R2vztzmRyrv1hRSeGmJb/mvehf8IePvuXGIOMEd0Qb6uWvaXk1nTR9Sg
	ev9l0Lb89RHemfe6LMhIXZBPr90Huk5bUkXoHs3hWr0tLslxAzLsbBRDdz1ht4cdXp2Rs8SP+wJ
	X9OmjjbALgfDJElDzNm53uIo+bgh+q9Lo2zZL62lm/7pUW3rdkqyfjEpaAmxF2vwyucH23XuxQ6
	KGXpqT51HSjIZ8im8nnT3Q8sBHc88vW1TkqXeFnKbfVDFYtE9yFZUbYuAzYGslHy+99lkiapikH
	cXJhIxj3D9ZnV6WCgj0WgzMR0zkW5LhHqhJskjj1WVn9K+fbmPtsFZiro3MMw404vi+dclEj1c/
	Iq+5zeAE/TlVoHMI08FnrM5neVWdVtjHO3jtdxfuU6H1EJm/Ipl+RWuXAZz4cT66LTn61l+KZAy
	XAD9g9qXU1UeQ8oxZAFtYs5qzqt1FRg91rMgQX5yWBUFBwf0Ogf/o3BxX3KDzXIrvQ==
X-Received: by 2002:a05:6830:4487:b0:7f4:d16e:45f9 with SMTP id 46e09a7af769-85d364bb459mr16188987a34.7.1793872919616;
        Thu, 05 Nov 2026 02:01:59 -0800 (PST)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm4280747a34.8.2026.11.05.02.01.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:01:58 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b19e291cc6so1477039eaf.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 02:01:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByN5oRU2gRW+jREuShmnciYXt8Z9pqBaMskUAnFlEbKHtl0LwkPFKii25k2j7EO2divEd3yX/TQgjWD@lists.linux-m68k.org
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr8218716137.13.1793872596997; Thu, 05 Nov 2026
 01:56:36 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-cleanup-v2-0-1e6687e226b1@kernel.org> <20261104-work-procfs-cleanup-v2-5-1e6687e226b1@kernel.org>
In-Reply-To: <20261104-work-procfs-cleanup-v2-5-1e6687e226b1@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkL=-oCgLA3HB0_Js_TdJ+P9FDBPF-u2z7uHrL+m7g-g@mail.gmail.com>
X-Gm-Features: AclHuK_YSG69l_UQ8CXymziWm2hhXR-Ce9gvdG6ZGXmuBEE26IV_RBgt33sxH_I
Message-ID: <CAMuHMdWkL=-oCgLA3HB0_Js_TdJ+P9FDBPF-u2z7uHrL+m7g-g@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] proc: drop the _buf suffix from the new methods
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

On Wed, 4 Nov 2026 at 22:16, Christian Brauner <brauner@kernel.org> wrote:
> The _buf suffix told them apart from ->proc_write(), ->proc_read() and
> ->proc_ioctl(), which copied to and from userspace themselves. Those
> are gone now. So drop the suffix. ->proc_write(), ->proc_read() and
> ->proc_ioctl() are the methods that work on procfs' buffers from now
> on, which is what kernfs calls its read and write as well.
>
> Done with sed. The flags and helpers in fs/proc that go with them are
> renamed to match.
>
> No functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

>  arch/m68k/kernel/bootinfo_proc.c                   |  2 +-
>  drivers/zorro/proc.c                               |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k/zorro

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
