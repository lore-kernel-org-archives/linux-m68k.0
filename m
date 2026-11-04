Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816525;
	b=VdxE/a0X8zIf5rq/eScnGiJpv8peqaSp30A0DpuSm/wka5Dc5tFaqPt5JMqE8MP49LCN
	 zZj5FgxvkZykapLd2QyjC5w1ZWH6/hIJch1kaWx39CCrggqmVo8M7YoJYp4DC4xxSU7Hq
	 n70Gk4yee6S3vH6+5Mv4gXbojDg8vQP07mmhsYZZYzLUhoFpt5OCHqhlvWjJpRKFiPckh
	 gQcpuLzWFBIfIJpElp7NNlG7b08W7hssDTasmIfAgB7eyExQW2FaSw+J0Qf7tmEPfizNH
	 GHsBT8QrytssufrvLd/uI96eJUqbRqI3x1w8C4Gw0fXJo83cGWbL2Ro4fCCGcOFu0XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816525;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VT57VP7WgX6dODi86xucfYo8nlOoB8EWvy9sdmMIM1Q=;
	b=i0iRUf89u+m76Fjwld0hdMbRFsNHfm3v5ZGxzz19vkIgr4OIm2mhezUpn8c5wZ846KVv
	 lwAS9dfst65/hFRma5MhwQjkb1G0//uAXoB6arzfBfdn2DcCDtnDSA2GcsLIUD3HD+9jV
	 XaxrN2c281c6naZIXhQXkcD6Mc7TAVkrdyFBZm6rzYl9orkzRV1OEuw9xTqZRx6zek7lk
	 NewWmNBgtlkSZclF4G4sfTmkQxFSapUoqg3vCcf6jlKOh1vyVjAuZrG/Iou31brwmuXGD
	 Dg1lssLf7riWjibKii6K6JeHsgMLeP+Nj/tTT+nOG31PPfZRSzaJHq32m94clljlF7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mai22/eh";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E5606EEB4
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 18:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6E5606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mai22/eh
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D91160A8D;
	Wed,  4 Nov 2026 18:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3C61F000C1;
	Wed,  4 Nov 2026 18:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816524;
	bh=VT57VP7WgX6dODi86xucfYo8nlOoB8EWvy9sdmMIM1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mai22/ehnYQUJcRGvan94k0/+b6zIHCBcC1h7Izfql+PLjJpBcZeNbw/U/Ej644Yw
	 giX6ua6GsiCnQFaFWt4TjPOQ8hEcHJWV53JArvxhLCzs/3ICQQ/dX3lSkkmka76Gxw
	 dJeHGdo1bsqlhPD/mSPHo0ujvpsEJKmun5AWjRl85gdGWoEJQF/Fw5N33mPJYbPxrZ
	 5/2Fky4g2+meb1USCZVxM6Qb/YC/rFTOoE0052GM1s9HY1GbAeX7j+Sa0fmFEYhhyQ
	 ou8zs04Lo62I0T9t3r2d6mIHkGf/me1R48r5vQpWRhoitrnuW2HBjfay74Nceg98Ou
	 ps8WEleSqxrKg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 04 Nov 2026 18:20:28 +0000
Subject: [PATCH v5 10/11] rust: make exports.o depend on the headers
 generated for it
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-build-speedup-v5-10-0f6018be8dae@kernel.org>
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
In-Reply-To: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: ljs@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Nicolas Schier <n.schier@fritz.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=ljs@kernel.org;
 h=from:subject:message-id; bh=x/2bqNrY4S1OgFbAxfQ/C9WsSucYeef8VeGkwgt+MGg=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJel+dtetva+Hx/ZHFROs+ly3vPxhdm/hNrXsVz+Yvk/
 kqNnSvYO0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRSClGhnk/LqWUOs46nLdK
 Z8aJAxf2vQ99el1lQqjsZIlpUsdiXmoyMvxxlQ4sfTtxec8kg9cW2bpqR3kPbQ9j2CPK8b3YxXb
 +Ew4A
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

rust/exports.c includes the exports_*_generated.h listing the symbols of
the core, bindings, kernel and helpers objects, but this is not expressed
in its Makefile.

This worked previously because the headers are always-y targets, and make
prepare built all of the rust crates first, which is an implicit
dependency.

Fix this as it is a dependency of the subsequent commit.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 rust/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..cee016cd8d32 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -728,6 +728,11 @@ endef
 $(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
 	+$(call if_changed_rule,rust_cc_library)
 
+# The exported symbol lists are generated from the crates' objects.
+$(obj)/exports.o: $(obj)/exports_core_generated.h \
+    $(obj)/exports_bindings_generated.h $(obj)/exports_kernel_generated.h \
+    $(if $(CONFIG_RUST_INLINE_HELPERS),,$(obj)/exports_helpers_generated.h)
+
 # Disable symbol versioning for exports.o to avoid conflicts with the actual
 # symbol versions generated from Rust objects.
 $(obj)/exports.o: private skip_gendwarfksyms = 1

-- 
2.56.0

