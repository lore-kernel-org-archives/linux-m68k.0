Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872925;
	b=DPS0ZAVRtgm9vvyWah/M6CowdStd72SKSXq0E5BskXXJbhrfd0rPiqCz2HP9RgrhlQ+/
	 IE0TeN2p4YEMkB9oWcPcILHhnZwvSWURxAUGwyPKgQc5jY3VI+qBextigcWMatHiu7Yhe
	 hrUTUDST0RrSBkLgu+v9ZQkX41o0sXfGhgdhcvrKn5IArEoiZGwDYDvD3XO2KwJjdthcD
	 gVg494ceZej0IqjMa2RHeYi9+ePpK0CZ6DFT6CHq82PN/QLcf1yXU45rZglSvayz7ODOv
	 J7VsMn1XqcuQt58qReDskVi7N9eYwIvE1zwN3KhJIADdyKvGPM06j5rvtsAScQZLD9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872925;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=tPMKPdazHRkx5ljXr2/MNT2dV3a8XsMJaPYl91qFW7GRmeXVEQcS65Fu5eihCVIypCYW
	 v0ztu1uuuin4Ud1VzIkTCLVRcdllbbYjmdG9rf5sGKpkqWM753DHcZemwjrjfefSygB/p
	 HdXfoochehn1e8ZTDZgxbRD/BFdsl6oXWanmayxUBAq5OVxUfX8j3eOtv4xNqVAB8BXzW
	 r0mDJSpix2y+9Ogfj3CZMvcEbsnqbPo5XupclCZYUTsEij3whScCR474V6BD8DfZPqRpC
	 n/KaQCJfvsti2xlcAeUNXDnrZIU5r/sBQEcrPrlGhTA1AFPmdSmfIvHrmIlx6M4VN4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD4606A31B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 10:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEAD4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c5e31bea9so23086626d6.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 02:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872924; x=1794477724;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=f+6wqgEdT3TA7SSUIdNAJAWlpQk2ADu1SMzHaCmaZZlmKtVM9QhpAraqapsdmO6/t8
         IaCfuSfbfcxC8oYrmY/mdv5ltOPbm0hfxViA8K7fU5++ii7v8L5HbU0A5jv6GI0SfX83
         V5IquLZQ6dPZClzht0Bc6fkIFbq9CGE9A42P/6m1CM1IgGfK28ubwSdGNB0WPz1lhZnc
         +NxBU9AqEhXxmE6OPVYuXQo0VJ4667xMpY4WX0i/08TVGUCOgBoHBIgGomrCuB+LpHjk
         xFe355u/nlapxvUpwtsrxlLoEfQ0odID0mWIU5tdxO0j0V7aMkjvLPUkYDIe0264ebN8
         5BFw==
X-Forwarded-Encrypted: i=1; AKwUvBxtjd4rWPbXp/ykcMYk+a3Lo53BycUhUqu0F8PQJsfCyEnSpqWcfxN7W45N3BMr/af5Yui3wd3QINLF@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/Gb82PNIwFPAkokaNZcJ0oZGbO9ApzHj55ZlAik7kZh+eR6oLA
	Y75mB7nbtWdfCHG5Kss3kFqx3UgGbfn3ZBzMG2WnG0OMF1HtIZ4FBhJIGomSN4Q5ooY=
X-Gm-Gg: AYBFou1jT2kutmIRlo+lurO1Kq4TgtpDkR+QsQ/Ndx5uKCoUvRwa5cGGL7FsBqscEkn
	RKuB4o5NaavEOgnXspoQa7S3bIYTfThRXY6loWgpzEUaAiHdGh6cghh8D1YDuPCjUsIeK7GtKy2
	JHc6IcAtynS/kZ0fnvJLaHdjYo2H51sr2QAH5g/Fw5ZxBtk6FtBVGzNPSG8lDU+ITdjIEptixN7
	HTfjLAC95nmqvSfA24e5us+jpw8SXSgYrsOfbhbcYVcN6uIj8kKTk0/uj4rVBvp5LCXMSJCIq6P
	Tpf7KXUKkdWaQhhSPYU42A8DjtPl4MY2nzWHlIRJAjxcpeXKu2gVpKjG3wxtypmKpzOPgg4S1mG
	3s8ShIoQM5Ec5dD8UbI6kkdxCWutAdNy+4oqyhtUgoYPBr6ygEsB2/tnRFQj792M54xR6G+LIs+
	q2RDCqasLGFj9nBcm5JIsskOugbBkTTbXVAKqdp3MLdYwAcAf0W/kciKPhZtTyCkpktdBWeflny
	NySQAj38G4VH0vVAwz48INRDqBtM1KwsXtVXUlJIHBWx5tO5JnhnfwaTH2QtF/jxcl9M+QeIG9w
	Ck72MESGI1ioBhWYgjQEXtRmG0zL2p/hLJaoWBRMFy+IVMH03x2QRildHzTtgxJIuTczVw==
X-Received: by 2002:a05:6214:2028:b0:917:aa2e:d007 with SMTP id 6a1803df08f44-91ca4b32e96mr308942206d6.12.1793872923791;
        Thu, 05 Nov 2026 02:02:03 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e939fc1d9sm22034936d6.18.2026.11.05.02.02.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:02:03 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e7ad9f78dso201312785a.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 02:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzjvfo2oVgfsVauXNNu0QqiD8b8Gd2zn+B2KeM7cyGEm5Py3smQPOnL+ChqECye10k5EmYAQ0puQubl@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
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

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
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
