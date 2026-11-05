Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902946;
	b=hSdlL5bJmxNEsfI1Su1twzd5vvGc+AL6u7fzSBooHEx61cYv2RE22t2VJHrUCJkXA7Ga
	 r306JrTGdtcVogGvl94GPgh5cQaATMzzGsGFKb0V7sfC43Y2dBFfom+eakB85oHnyJ7bR
	 NqiA0g/zoN0kknwmYDBIGpTsrFpJnFgpPmr8NeLtn8ku73n+F6QfpzAE7Gbj98SHXBukt
	 nfF/MXo9dzL+78XXKkY4I+YbHsgPCumQ3VRcyDZdzPjrw1vAlGfsSn1KezgEe+1K+JFgI
	 jGpJz0K4B3HsyOpkXkof1gl/iyyyHLFmJ575zNGO8wXp+HkCdQTt7wi/KtBChRkaYGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902946;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=OWrwl37cFLJjEpx7NnVtWwuGNit4+A7xxvc5vOIZJ/4=;
	b=ET1w96BD010kW6PF2Gt2idFSWWe5kQsAC+jZ2mOhNm8qkNZQF7AOpDywUDZc+UlzzWD5
	 QCpPrNrI0BgqYJU1W2dnjBjcj4NELHpFX8ZeXJoPCVIRlStY+l6BE/Cs1SWA3IV4Jct/J
	 iqs8Y0ayulZTQeg4rUTD4c1GLan6UYZ7P9lRdmsN1HIR2zXie1P5N7FTFvh0UGsTj8rfy
	 mclPLfaTKWQ5ZR1HHvLrYmU80MlX5Zor+j2cIQm3lJIEODTOdFqqOev1Tkzw3AMlBVP5d
	 221eoXv6Vm8UWP61ZkPG53PtI+jLakfEyk1o10V3bobP5SR92sFo1QvntzvioM8xg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUuOzXMz;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC2606A33A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 18:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DC2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUuOzXMz
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80B5340B9D;
	Thu,  5 Nov 2026 18:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DC41F0093A;
	Thu,  5 Nov 2026 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902945;
	bh=OWrwl37cFLJjEpx7NnVtWwuGNit4+A7xxvc5vOIZJ/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUuOzXMzuHRXA284XH0ntuGqd139PcG77eQ6VN66a2WqcloXRcseupIarLDuLUUX6
	 A83QR0tuYS9dKEUdSLircRMiryflYEWib4fc70oiY8hrynd9ulJ9oHP208NTsbH8dn
	 ZhsX+ir8P/EKHqmNk9b79LGBPe9qVrFNrrslOjOAH1wEXg9wAyf5B0YgehlPzFpZYj
	 wZDaro3mzXUTh7fj8zeNfSmNhlDhkfFly017z+iFizqNPoK/Zi6zbxv5M7/zxyHWnS
	 oMLFqZvMYwtG0rozhLK/o54q0IiqP19kBatpZYy80LXvg1trfPVN89vxX7bW3nVf1e
	 81ufpHZtmCIMA==
Message-ID: <sashiko-outbox-199750@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/11] objtool: size the instruction hash to the text
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, "Luis Chamberlain" <mcgrof@kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez" <da.gomez@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Aaron Tomlin" <atomlin@atomlin.com>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?b?T251ciDDlnprYW4=?= <work@onurozkan.dev>
Cc: linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org
In-Reply-To: <20261104-build-speedup-v5-8-0f6018be8dae@kernel.org>
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-8-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 18:22:23 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] objtool: unguarded NULL file->insn_hash dereference in find_insn=
()
--

commit 213d34d383fb04e85ef5c721bf77b5b42b0870d5
Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>

objtool: size the instruction hash to the text

This commit replaces the fixed-size instruction hash table in
struct objtool_file with a dynamically allocated hash table sized
according to the total text section size in decode_instructions().

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 931c5c412f15d..97250aa361009 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -38,12 +38,22 @@ struct disas_context *objtool_disas_ctx;
> =20
>  size_t sym_name_max_len;
> =20
> +static struct hlist_head *insn_hash_head(struct objtool_file *file,
> +					 struct section *sec, unsigned long offset)
> +{
> +	/* Determine instruction hash based on section index and offset. */
> +	const u32 sec_hash =3D sec_offset_hash(sec, offset);
> +	const u32 hash =3D hash_min(sec_hash, file->insn_hash_bits);
> +
> +	return &file->insn_hash[hash];
> +}
> +
>  struct instruction *find_insn(struct objtool_file *file,
>  			      struct section *sec, unsigned long offset)
>  {
>  	struct instruction *insn;
> =20
> -	hash_for_each_possible(file->insn_hash, insn, hash, sec_offset_hash(sec=
, offset)) {
> +	hlist_for_each_entry(insn, insn_hash_head(file, sec, offset), hash) {
>  		if (insn->sec =3D=3D sec && insn->offset =3D=3D offset)
>  			return insn;
>  	}

[Severity: Medium]
As reported by Sashiko on v4 [1], can find_insn() dereference a NULL
file->insn_hash pointer if decode_file() fails before reaching
decode_instructions()?

With this change, file->insn_hash is NULL and file->insn_hash_bits is 0
until decode_instructions() calls alloc_insn_hash(). However, in
decode_file(), init_pv_ops() runs before decode_instructions():

tools/objtool/check.c:decode_file() {
	if (init_pv_ops(file))
		return -1;

	/*
	 * Must be before add_{jump_call}_destination.
	 */
	if (classify_symbols(file))
		return -1;

	if (decode_instructions(file))
		return -1;
}

If init_pv_ops() -> add_pv_ops() returns -1 (for instance, when
find_symbol_by_offset() returns NULL for a pv_ops table relocation),
check() and cmd_klp_checksum() jump to out: and unconditionally call
free_insns(file) (as well as disas_funcs() when opts.disas is set).

free_insns() then walks all sections via for_each_insn() ->
sec_for_each_insn() -> find_insn(), calling insn_hash_head() with
file->insn_hash =3D=3D NULL and file->insn_hash_bits =3D=3D 0, which perfor=
ms a
32-bit shift by 32 in hash_32() and dereferences NULL in find_insn().

Should find_insn() (or free_insns()) check if (!file->insn_hash) before
looking up instructions?

[1] https://lore.kernel.org/r/20260923-build-speedup-v4-18-73128809a4a4@ker=
nel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-build-spee=
dup-v5-0-0f6018be8dae@kernel.org?part=3D8
