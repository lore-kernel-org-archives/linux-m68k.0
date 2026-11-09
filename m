Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242593;
	b=qI0H+j4fLlbRSSAzWfNFKjdMK0ahhdCX78hRYnHA1leQn5ramVLCdWLjkkakfzt6q8jM
	 A3MZpyvDHSf0pKIkwHyAH0mLUoAhAtj0oww3awqqJWiYm/gGAmMaMLbaSy1DCpTNsYzge
	 sOsMLrjK1Z9FkOLLODx9Yv3YwmQPSi91t8b/KsYsFkCsB1dLLKSCCh3ZoSN1qZigbDLhY
	 pKzh/fOMtTh1ygxY2ipSU7BIl7hBPk7nbKicQmo4J0+XrzNX1QfbxHG+oUL1RyfPQPWNq
	 qLYZCAUo6d7m+lUM/7a3W3EjoBQBOX+89S8uSAgE6IhNI1VdI03QBssPQwWbvIvJG/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
	b=T7Tq9RtbqpZ2vQmSFIr0tOwXiu4hKt4wR5Yl8fLfI2S4b9NTPKbzxlLJVsfNE0oublQQ
	 GFBqsPXAbfbgViydCdQ72g1t8GZNxNaJyGfP85RKAfdLX3lfAgawmdZsquP0DCPM2+c88
	 peAWCn60DNm99HGrWU8EZoVAvsJDoPMAKj9VOHR6rrqj8RAQQRPb0nAYkCmAotcStwgfm
	 +VDNmif5tdal0WvX+aO+xC3h9yHsF14pnab8WEyS+BX/avEpZxkqlCU92buK7RRK3oByd
	 z+wWiJq412TcNFIp9PianCZbIcKIUt5bjwX+tLkPuIuyGdRUUyNOSkzwvpQkzQKJEeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GhTmoosv;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B314D606A332
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 16:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B314D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GhTmoosv
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4910b863b84so707597f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794242591; x=1794847391; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=GhTmoosvjtuD+UCXG75upTaLlOPXrF1iBIYwEBnDZpDo2RO3yBZIg+TzLRpvgvkWmf
         rxrURtdbAXO5KVKGTWvqpAoAdHkHSOWzBCzhlTDDi0ej4HBteW0wWu3Fm9G4xYNPy786
         bLokaJ1n0zk7S3yZeA34ZkGP8r7iUACd03kg3qhSe5XIlKBP7mtFddodMdoNSgZl1VL6
         aNMqgBSCwyjhRr2A2A3r3Hq7S7vCP8xz/Mg57hkQx4X42Ws4oJjsWtZ5m2iKQkLa8Tk7
         7y1lv7MHUAAIY3CiMEpzqlPbgetWSM4HF1K0kcQkzhU3gM7SEK/6HvrLhmAEknoZvYO/
         r5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242591; x=1794847391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=GOmCSm2RGiJ2P0e7RtG9kbJxsyTZJWGcRZ+sEBVe2ZWmB5mrwZVeUtD5EQEH67lmZ8
         gBsTHLigpfDjXAY1AWGIWMEUakArgVnrurpnyaj59VwPsiKN8U/5+Rt46Im90qKdVDC9
         GsCypwG/bBUDYgWnjlEmLjhtNORG8BJPKynAwcAnnbBa+iigJHaMdPTCug7lu8seqNkB
         wqhD0C9cZaCjf8U2c/TXWYFDj9ev7E3PZfD+249q50jiKnhSRm9alvTHWfuIy/ZJqRGq
         7iDhw2uz9ZltkPf6cy5kivjQ/eETu6wij8mHE1LwZokRs5DduhP2VucA0DtbAiv+cOx9
         Ek3A==
X-Forwarded-Encrypted: i=1; AL+hErGiLGv95Iu0vVyjhezcdpBYrng5OODfgc0ncnAmrI3hnVKGfhXI8foYyfbVUi1th2nCW0WrhcubZez+@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+x8ePp+JqsdGyRfkhOv7SV5uPlwtwcbEd1FiWf7D9uyIsSBlHc
	H94S+8RqcFr9UCCU5UvWAY9+FbGq0oZ5An563+is1QmgjaUGDZP3W5dkSspBqRb+rPM=
X-Gm-Gg: AYBFou3z0SFSFJw2enhpIfXXg0k4cC0y7+DFD6mz6RZXYYWmS1WBSOf2QyXvn16bcE5
	YDY59jnCKrtYxkJEtM7FC78ZTCwWp5CK6nRHwHsepBRRbF3WZQF+qHcjSsR9M2hvRqFBLJxZMFc
	1PIfYylQOriQdy2VM0wEh2vwKf2hVWyYO7UXqkNcJs/5jym+Zr6MZ5AssTmBNVOW7mKheSpF9H3
	AmE1SxyVYuafmsPIySSuhTCWFB2rvaEiPShGFUzbCfxiqGgueZfpapWU324RijgaPCr24fE0xnJ
	lLEZ+90hThehsVg0H3zgWifXsJ1t0J0lUymXh2n9WGoHoTSKxVotLqzyQdAjnXZ67vIh2uU6Bgz
	ZFzvPBjFD3OGYW6D5RbmMQVti3z3XJi4cpeAhr+T9bSYLIVzxRJ5LpEo29f4jKykIqlHu1Wi4yF
	3W6SVPWl3uOMjm5/AfrckUGZdyTQRqWf4VAUrBq9vu9E4/IJXCek1GitUlu2IUzuBcltsVUQtIU
	ESFIbIbqha4AxrtcrunqIn/kr0oGYKBBBRT8hZ0440H+n946LZ1bKNFi46TQCno6wIrWy6XRkl6
	96jEGYrVqMdYzjeG1mC3yTSlk6ZiExi2ogs/9zB4mglg2W4MOaGHPZOJ2jTIUl8u
X-Received: by 2002:a05:600c:3508:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ba015b8c6amr1961265e9.0.1794242591012;
        Mon, 09 Nov 2026 08:43:11 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8ae9fsm806785e9.3.2026.11.09.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:43:10 -0800 (PST)
Message-ID: <1dddcf29-36a9-4ffd-999f-54b730c9ea27@suse.com>
Date: Mon, 9 Nov 2026 17:43:09 +0100
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] modpost: cache section relocation mismatch state
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:20 PM, Lorenzo Stoakes (ARM) wrote:
> For every relocation modpost invokes check_section_mismatch() to determine
> whether there is any kind of mismatch between the source and destination,
> and if so which classification applies.
> 
> Each time it does this it invokes section_mismatch() which iterates
> through the sectioncheck[] array every time it's called.
> 
> When walked a relocation section the source is fixed and there aren't many
> targets, so the same names are looked up over and over again.
> 
> Therefore cache not only mismatch categorisation but also whether a
> mismatch even exists for a given section and look up the sections in the
> cache.
> 
> Special indices (undefined, absolute, common) take the uncached path as
> before.
> 
> This results in very significant speed ups for allmodconfig incremental
> builds.
> 
> modpost is on the serial tail of every build that links vmlinux.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.5s     8.3s    -0.14s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      7.7s     7.6s    -0.13s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    33.9s    29.4s     -4.5s (-13%)
>   x86 allmodconfig, touch mm/vma.c, clang  31.9s    27.9s     -4.0s (-13%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Looks reasonable to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
