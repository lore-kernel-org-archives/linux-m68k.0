From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/3] m68k: use jbsr to call functions
	instead of bsrl
Date: Sun, 20 May 2012 11:15:44 +0200
Message-ID: <CAMuHMdX=FTS11g_t+dW+FfY4J4yX0ursHGfdArnjZHmByMCMDg@mail.gmail.com>
References: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
 <1337314971-11087-3-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1337314971-11087-3-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

T24gRnJpLCBNYXkgMTgsIDIwMTIgYXQgNjoyMiBBTSwgIDxnZXJnQHNuYXBnZWFyLmNvbT4gd3Jv
dGU6Cj4gRnJvbTogR3JlZyBVbmdlcmVyIDxnZXJnQHVjbGludXgub3JnPgo+Cj4gVGhlcmUgaXMg
YSBmZXcgcGxhY2VzIHRoYXQgdGhlIG02OGsgZW50cnkgY29kZSB1c2VzIHRoZSBic3JsIGluc3Ry
dWN0aW9uCj4gdG8gY2FsbCBvdGhlciBmdW5jdGlvbnMuIFRoYXQgaW5zdHJ1Y3Rpb24gaXMgb25s
eSBzdXBwb3J0ZWQgb24gNjgwMjAgYW5kCj4gaGlnaGVyIENQVSB0eXBlcy4gSWYgd2UgdXNlIGpi
c3IgaW5zdGVhZCB0aGUgY29kZSB3aWxsIGJlIGNsZWFuIGZvciBhbGwKPiA2OGsgYW5kIENvbGRG
aXJlIENQVSB0eXBlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgVW5nZXJlciA8Z2VyZ0B1Y2xp
bnV4Lm9yZz4KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgwqAgwqDCoCAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwp1Q2xpbnV4LWRldiBtYWlsaW5nIGxpc3QKdUNsaW51
eC1kZXZAdWNsaW51eC5vcmcKaHR0cDovL21haWxtYW4udWNsaW51eC5vcmcvbWFpbG1hbi9saXN0
aW5mby91Y2xpbnV4LWRldgpUaGlzIG1lc3NhZ2Ugd2FzIHJlc2VudCBieSB1Y2xpbnV4LWRldkB1
Y2xpbnV4Lm9yZwpUbyB1bnN1YnNjcmliZSBzZWU6Cmh0dHA6Ly9tYWlsbWFuLnVjbGludXgub3Jn
L21haWxtYW4vb3B0aW9ucy91Y2xpbnV4LWRldg==
