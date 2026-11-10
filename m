Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273706;
	b=hoqKUD9wzDyEkFLLAvntJiZPc+6kGr72y6L+7MrNdyRy2J1g+rE7H7JFF1EZB4UWqEPx
	 Xey6oN4Ti9W/oK1I+EfvhHyUL4TNBS3LQFAkQuJif8yCZw1rmqjFsPcmq2lk/TYphvV/+
	 xMBXmZskg5ODesFG992IINq5Hmp+qiOg0Nras+VF9E6w4vNKkxpIkO4UmdWZ/7h2mavXi
	 eEjlOMkxVL/+h+lEMyX2cFUm5sjTbQbd0IJSc2o6IIYz08UAXDnTAXW/lPOvHF51DbN3I
	 CK5T8m6ZIT9MklcNhRoaiyn3IsGcmn5K5f9yafvcdsxONO8SY30HPjy+gvOWsscUbhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=eT+IUzzn49yhDfB6TykGy7o3tQrdBMWj8Apgoj7P+TNZmLAbIOPNUeMnMLzGkgj42nky
	 OqHd4dlu/Q+dQR/tC4LSVmHcjMPGbTnWfOCea/MC9HPB+w//hR9APpu1Bd6v2aWH5rgUr
	 9UkRg7gQib5g9NWxq8QcwesX70LY7OAx6uVayQVtMcypeS6R+XBvmXObF3we9mAyPgbQp
	 5/5fPy1SV9MZT/NER7eGWHOUiCUIMFCpS1u3bU2jmXdGz9MJ5XiH8S8lXO26oWgnGx9Mk
	 pxjHHHR9/VbBtvNdMjLweN0ADwfE3WpRwl4IiKdoUK1iibFwjlDqg+/5oWCyDiSir4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=g9XZsHfW;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9E5606A333
	for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Nov 2026 01:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A9E5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=g9XZsHfW
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cdc606b47so217272466b.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Nov 2026 17:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273704; x=1794878504; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=g9XZsHfWSwwM/ImvZ4CZUgYJ+MyL+01BWr21NCOQuaO5d5k4CElcVVgKAOv9JdJ+BM
         cTPpU7KhDvdv/mX8pkHsbb2YwJGFqIaPqYatLCsDk7jPMV7aKTs/+GpbekKefg1ok3Kv
         PcrXxASDpxjtJ+6HtgbQ/y6u2OLLhC2Yc3iCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273704; x=1794878504;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=bjZDgJxWlZT9z2fL54EtAV/3z2PKVprjUCmV7DhP8Ec7O8uqF5myoPJEF/DZuEkvmd
         W7vTSgC40awz/dglPWSUkfTMtCCh4q3645Rtzain6kNSJQ1GPESqEoyJJT+kUt5nRi/M
         lb6orYFrfmVx24T2NqTFEO2E1ARjHh1ipTtcYFcbDSvevP5OdbPg2Az3JGXqY5mmO06g
         RBhrzK65t0IEEsbud8zzoPtSV3c66ACPIMpmQVTA3+XaTK6Uh8FdsSY4pMckcrtY5/gq
         Us/AKetU3GWKaStfOv8Elqy1BWYW3QmJn8G3ECxLFscxLtatzzTcI0YFs+j7ESrbp7Bj
         F81w==
X-Forwarded-Encrypted: i=1; AL+hErH1TSVWdKuaWuM6kuk7wyl8HmCjvWM8kThBhWzHrVScniOZ1XViRA/PxlJHe2wGtZ0I6QR76swlttZj@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z97e5qdTlojZvlPA42zlyCyIVJw1KCn4KomNgoUYzGfzPjIMz6G
	6oc5wh4y2ayqV/vdGyoF5/KWLHkpgQMrgXU6IQy7wu1CDSgAeTq7XecwMyzBku3IdJE44QAgLRk
	x5qs0loK+OA==
X-Gm-Gg: AYBFou12qnOGNbnYR/XAxm4qjgJpvHRELMJuafu/T43PSgP5JKsozxf2r0SQuPvC0gZ
	AJPnJS6JuwGbwXX0xcuP1urZHVECQOBO8fMyPO5qngdajO18PpfAmuNr68x8m24BiVQJVmy2q7i
	7fmzOT47B//xqRm1lkT03vMxMCF+eVr51UXusaM0mlNC+tu3AfjZvh/quIilOPMtUFW1SNVw2p7
	hQ2Ye2EeYOdNGwD9sL4xwXu2XWU3/vZp3iWbXxGzG4mnzkYw0gXm7uhfp8lPWOJFkKhWnSb455X
	EsUxkzo4jyA1u65ShFXwRlHKpFRcz/HP+a42GzqnoLR67zLg+NOfUzeF5lSoJjERMUbKU7w7EfY
	ybVBY0A1aFsCkLot64+4Q24Nhu2u9jqzxjkfCCQPP4rrRg4nGCLR0tcRIJWtxUyZn3voVzLBZ8+
	fx+pZFWfFIfAH1j7WWLOPzo5pS6C4S862lvcQrac6OUh662uidqcaFOzeA8jW2zfZLddWUQOwgK
	kM9t4AQtZRnKfHuwIO2V9nYN5GABuLvbI9NN3yorai3K+mKYjGx3y4g6WNpDaCl1Ufhl02bd2LZ
	bUxBWySSItzFXGPhsCW1GgDJ+KAe7ynm9Koh2zACWQsR3J5FbKJs1WP9Em2Tw8Ysk48TTn5HsBO
	o6g==
X-Received: by 2002:a17:907:fd15:b0:c24:87e5:6491 with SMTP id a640c23a62f3a-c5049451cf8mr88942666b.2.1794273703939;
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm41372366b.17.2026.11.09.17.21.43
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:21:43 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4c9abc1824so221728366b.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Nov 2026 17:21:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGLeXh3caL8I/q7tSi3NuJUVYdBpXuWVBbHmlnitrcuEf8762b4PUcREgkMe43YPBFyYiDiWYH0Ec8Z@lists.linux-m68k.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
